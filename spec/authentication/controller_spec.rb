# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Dummy::ExampleController, type: :controller, skip_login: true do
  include MasterControl::SpecHelpers::SharedExamples::AuthenticatedController

  describe 'GET index' do
    let(:params) { {} }

    describe 'restricting access' do
      before do
        allow(subject).to receive(:current_user).and_return(current_user)
      end

      context 'when NOT logged in' do
        let(:current_user) { nil }

        it_behaves_like 'access_denied', :get, :index
      end

      context 'when logged in' do
        let(:current_user) { {} }

        it_behaves_like 'success', :get, :index
      end
    end

    describe 'authenticating' do
      let(:current_user) { nil }
      let(:authorization_headers) { nil }
      let(:user_id) { SecureRandom.uuid }
      let(:user) { double('user', id: user_id) }
      let(:payload) { { id: user_id } }

      before do
        allow(subject).to receive(:current_user).and_return(current_user)
        allow(subject).to receive(:load_user_for_authentication).and_return(user)

        request.headers[:Authorization] = authorization_headers
      end

      context 'with an INVALID token' do
        let(:authorization_headers) { 'Token INVALID' }

        it_behaves_like 'access_denied', :get, :index
      end

      context 'with a VALID token' do
        let(:authorization_headers) { 'Token VALID' }

        before do
          allow_any_instance_of(MasterControl::Authentication::Service).to receive(:payload_for).and_return(payload)
        end

        it_behaves_like 'success', :get, :index
      end
    end

    describe 'current_user' do
      let(:authorization_headers) { 'Token VALID' }
      let(:user_id) { SecureRandom.uuid }
      let(:user) { nil }
      let(:payload) { { id: user_id } }

      before do
        allow(subject).to receive(:load_user_for_authentication).and_return(user)
        allow_any_instance_of(MasterControl::Authentication::Service).to receive(:payload_for).and_return(payload)

        request.headers[:Authorization] = authorization_headers
      end

      context 'before the request' do
        it 'is not set' do
          expect(subject.current_user).to be_nil
        end
      end

      context 'after the request' do
        before { get :index }

        context 'when user exists' do
          let(:user) { double('user', id: user_id) }

          it 'sets the current user' do
            expect(subject.current_user).to_not be_nil
          end

          it 'the user id matches the payload id' do
            expect(subject.current_user.id).to eq payload[:id]
          end
        end

        context 'when user does NOT exist' do
          let(:user) { nil }

          it_behaves_like 'access_denied', :get, :index
        end
      end
    end

    describe 'shared behaviours' do
      before do
        # Mock what happens when we cannot find a user for a given id
        allow(User).to receive(:find_by).and_raise MasterControl::Exceptions::AccessDeniedError

        # Mock what happens when we *can* find a user for a given id
        allow(User).to(
          receive(:find_by)
          .with(id: current_user.id)
          .and_return(current_user)
        )
      end

      it_behaves_like 'an authenticated controller action', :get, :index
    end
  end
end
