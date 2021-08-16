# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::Customer do
  let(:canonical_klass) { 'MasterControl::Models::Customer' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:id) { SecureRandom.uuid }
  let(:name) { Faker::Company.name }
  let(:npi) { Faker::Lorem.sentence(word_count: 3) }
  let(:active) { true }
  let(:aasm_state) { 'new' }
  let(:customer_type_name) { 'Management Customer' }
  let(:customer_type_system_code) { 'management_customer' }
  let(:has_state_event) { true }
  let(:state_event) { 'update_state!' }
  let(:management_customer_id) { SecureRandom.uuid }
  let(:owner_id) { SecureRandom.uuid }
  let(:ib_applications) { [{ id: SecureRandom.uuid, name: 'ib_authenticate' }] }
  let(:amd_login_url) { 'https://partnerlogin.advancedmd.com' }
  let(:amd_username) { 'API_FULL' }
  let(:amd_password_encrypted) { 'password' }
  let(:amd_password_encrypted_iv) { 'password' }
  let(:amd_office_key) { '12365' }
  let(:amd_app_name) { 'API' }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }

  let(:customer) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      created_at: created_at,
      updated_at: updated_at,
      id: id,
      name: name,
      npi: npi,
      owner_id: owner_id,
      active: active,
      aasm_state: aasm_state,
      customer_type_name: customer_type_name,
      customer_type_system_code: customer_type_system_code,
      has_state_event: has_state_event,
      state_event: state_event,
      management_customer_id: management_customer_id,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      ib_applications: ib_applications,
      amd_login_url: amd_login_url,
      amd_username: amd_username,
      amd_password_encrypted: amd_password_encrypted,
      amd_password_encrypted_iv: amd_password_encrypted_iv,
      amd_office_key: amd_office_key,
      amd_app_name: amd_app_name
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::Customer.json_schema, customer)
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
      :name,
      :npi,
      :aasm_state,
      :owner_id,
      :active,
      :customer_type_name,
      :customer_type_system_code,
      :has_state_event,
      :updated_by_id,
      :created_by_id,
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
    [].each do |attribute|
      context attribute do
        let(attribute) { [
                            :management_customer_id
                          ] }

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
