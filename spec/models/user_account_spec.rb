# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::UserAccount do
  let(:canonical_klass) { 'MasterControl::Models::UserAccount' }
  let(:version) { '1.1.0' }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:id) { SecureRandom.uuid }
  let(:is_active) { true }
  let(:email) { Faker::Internet.email }
  let(:first_name) { Faker::Name.first_name }
  let(:last_name) { Faker::Name.last_name }
  let(:customer_id) { SecureRandom.uuid }
  let(:roles) { [{ id: SecureRandom.uuid, name: 'Admin' }] }

  let(:user_account) do
    {
      canonical_klass: canonical_klass,
      version: version,
      created_at: created_at,
      updated_at: updated_at,
      id: id,
      is_active: is_active,
      email: email,
      first_name: first_name,
      last_name: last_name,
      customer_id: customer_id,
      roles: roles
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::UserAccount.json_schema, user_account)
  end

  context 'happy path' do
    specify { expect { validate! }.to_not raise_error }
  end

  describe 'required attributes (not nil)' do
    [
      :canonical_klass,
      :version,
      :created_at,
      :updated_at,
      :id,
      :is_active,
      :email,
      :first_name,
      :last_name,
      :roles
    ].each do |attribute|
      context attribute do
        let(attribute) { nil }

        specify { expect { validate! }.to raise_error JSON::Schema::ValidationError }
      end
    end
  end

  context 'nullable attributes' do
    [].each do |attribute|
      context attribute do
        let(attribute) { nil }

        specify { expect { validate! }.to_not raise_error }
      end
    end
  end

  context 'empty array attributes' do
    [:roles].each do |attribute|
      context attribute do
        let(attribute) { [] }

        specify { expect { validate! }.to_not raise_error }
      end
    end
  end

  context 'format validations' do
    [:created_at, :updated_at].each do |attribute|
      context attribute do
        let(attribute) { '' }

        specify { expect { validate! }.to raise_error JSON::Schema::ValidationError }
      end
    end
  end
end
