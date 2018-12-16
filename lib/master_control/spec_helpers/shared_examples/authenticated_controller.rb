# frozen_string_literal: true
module MasterControl
  module SpecHelpers
    module SharedExamples
      module AuthenticatedController
        extend RSpec::SharedContext

        shared_examples_for 'an authenticated controller action' do |verb, action|
          context 'authentication', :skip_login, :skip_before do
            before do
              allow_any_instance_of(MasterControl::Authentication::Service).to receive(:payload_for).and_return(payload)

              request.headers[:Authorization] = 'Token VALID'

              # Caveat emptor: the `params` here come from the `let` context in the including context
              # Unfortunately, rspec does not let us explicitly pass `let` variables to shared examples
              send verb, action, params: params, format: :json
            end

            context 'with a valid user id in payload' do
              let(:payload) { { id: current_user.id } }

              it 'returns a success response' do
                expect(response).to have_http_status(:success)
              end
            end

            context 'with an invalid id in payload' do
              let(:payload) { { id: 'FAKE-USER' } }

              it 'returns an unauthorized response' do
                expect(response).to have_http_status(:unauthorized)
              end
            end
          end
        end
      end
    end
  end
end
