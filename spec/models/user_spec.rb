# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::User do
  let(:canonical_klass) { 'MasterControl::Models::User' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:id) { SecureRandom.uuid }
  let(:active) { true }
  let(:email) { Faker::Internet.email }
  let(:first_name) { Faker::Name.first_name }
  let(:last_name) { Faker::Name.last_name }
  let(:aasm_state) { 'new' }
  let(:customer_id) { SecureRandom.uuid }
  let(:roles) { [{ id: SecureRandom.uuid, name: 'Admin' }] }
  let(:ib_applications) { [{ id: SecureRandom.uuid, name: 'ib_authenticate' }] }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }

  let(:user) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      created_at: created_at,
      updated_at: updated_at,
      id: id,
      active: active,
      email: email,
      first_name: first_name,
      last_name: last_name,
      aasm_state: aasm_state,
      customer_id: customer_id,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      roles: roles,
      ib_applications: ib_applications
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::User.json_schema, user)
  end

  context 'happy path' do
    specify { expect { validate! }.to_not raise_error }
  end

  describe 'required attributes (not nil)' do
    [
      :canonical_klass,
      :master_control_version,
      :is_sync_update,
      :version,
      :created_at,
      :updated_at,
      :id,
      :active,
      :email,
      :first_name,
      :last_name,
      :aasm_state,
      :updated_by_id,
      :created_by_id,
      :roles,
      :ib_applications
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
