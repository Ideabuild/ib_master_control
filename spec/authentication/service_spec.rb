# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Authentication::Service do
  describe 'payload_for' do
    let(:application) { 'spec_application' }
    let(:logger) { double('logger', error: true, warn: true, info: true, debug: true) }
    let(:secret) { 'SPEC-SECRET' }

    before do
      MasterControl.configure do |config|
        config.application = application
        config.environment = :test
        config.logger = logger
      end
    end

    subject { described_class.new(secret) }

    context 'with VALID token' do
      let(:token_expiration) { 1.hour.from_now.to_i }
      let(:options) { { email: 'test@example.com', application: application } }
      let(:token) { jwt_token(secret, token_expiration, options) }

      it 'returns the token data' do
        payload = subject.payload_for(token)
        expect(payload).to include(:id, :first_name, :last_name, :email, :roles, :active)
        expect(payload[:email]).to eq(options[:email])
        expect(payload[:roles]).to eq(['data_entry'])
      end
    end

    context 'with VALID token for an inactive user' do
      let(:token_expiration) { 1.hour.from_now.to_i }
      let(:options) { { active: false, application: application } }
      let(:token) { jwt_token(secret, token_expiration, options) }

      it 'raises exception' do
        expect { subject.payload_for(token) }.to raise_error(MasterControl::Exceptions::AccessDeniedError)
      end
    end

    context 'with INVALID token' do
      let(:token_expiration) { 1.hour.from_now.to_i }
      let(:token) { jwt_token('WRONG-SECRET', token_expiration, application: application) }

      it 'raises exception' do
        expect { subject.payload_for(token) }.to raise_error(MasterControl::Exceptions::AccessDeniedError)
      end
    end 

    context 'with VALID expired token' do
      let(:token_expiration) {  1.hour.ago.to_i }
      let(:token) { jwt_token(secret, token_expiration, application: application) }

      it 'raises exception' do
        expect { subject.payload_for(token) }.to raise_error(MasterControl::Exceptions::AccessDeniedError)
      end
    end

    context 'with VALID token that does not expire' do
      let(:token_expiration) { nil }
      let(:token) { jwt_token(secret, token_expiration, application: application) }

      it 'raises exception' do
        expect { subject.payload_for(token) }.to raise_error(MasterControl::Exceptions::AccessDeniedError)
      end
    end

    context 'with VALID token that expires beyond the threshold' do
      let(:token_expiration) { 2.years.from_now.to_i }
      let(:token) { jwt_token(secret, token_expiration, application: application) }

      it 'raises exception' do
        expect { subject.payload_for(token) }.to raise_error(MasterControl::Exceptions::AccessDeniedError)
      end
    end
  end

  # rubocop:disable Metrics/MethodLength:
  def jwt_token(secret, expiration, options = {})
    data = {
      id: '00000000-0000-0000-0000-000000000000',
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      active: true,
      roles: ['data_entry'],
      applications: [
       options[:application]
      ],
      permissions: {
        billing_providers: '-',
        holding_companies: '*'
      }
    }.merge(options)

    payload = { data: data }
    payload[:exp] = expiration if expiration.present?

    JWT.encode payload, secret
  end
  # rubocop:enable Metrics/MethodLength:
end
