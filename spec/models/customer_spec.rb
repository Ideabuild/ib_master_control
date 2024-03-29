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
  let(:active) { true }
  let(:aasm_state) { 'new' }
  let(:amd_login_url) { 'https://partnerlogin.advancedmd.com' }
  let(:amd_username) { 'API_FULL' }
  let(:amd_password_encrypted) { 'password' }
  let(:amd_password_encrypted_iv) { 'password' }
  let(:amd_office_key) { '12365' }
  let(:amd_app_name) { 'API' }
  let(:name) { Faker::Company.name }
  let(:npi) { Faker::Lorem.sentence(word_count: 3) }
  let(:customer_provider_id) { SecureRandom.uuid }
  let(:customer_type_name) { 'Management Customer' }
  let(:customer_type_system_code) { 'management_customer' }
  let(:dwh_id) { 132 }
  let(:has_state_event) { true }
  let(:management_customer_id) { SecureRandom.uuid }
  let(:owner_id) { SecureRandom.uuid }
  let(:state_event) { 'update_state!' }
  let(:tax_id) { SecureRandom.uuid }
  let(:use_management_customer_work_queues) { true }
  let(:ib_applications) { [{ id: SecureRandom.uuid, name: 'ib_authenticate' }] }
  let(:managed_customers) { [{ id: SecureRandom.uuid}] }
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
      active: active,
      aasm_state: aasm_state,
      amd_login_url: amd_login_url,
      amd_username: amd_username,
      amd_password_encrypted: amd_password_encrypted,
      amd_password_encrypted_iv: amd_password_encrypted_iv,
      amd_office_key: amd_office_key,
      amd_app_name: amd_app_name,
      customer_provider_id: customer_provider_id,
      customer_type_name: customer_type_name,
      customer_type_system_code: customer_type_system_code,
      dwh_id: dwh_id,
      has_state_event: has_state_event,
      management_customer_id: management_customer_id,
      name: name,
      npi: npi,
      owner_id: owner_id,
      state_event: state_event,
      tax_id: tax_id,
      use_management_customer_work_queues: use_management_customer_work_queues,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      ib_applications: ib_applications,
      managed_customers: managed_customers
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
      :active,
      :id,
      :aasm_state,
      :customer_type_name,
      :customer_type_system_code,
      :has_state_event,
      :name,
      :owner_id,
      :tax_id,
      :use_management_customer_work_queues,
      :updated_by_id,
      :created_by_id,
      :ib_applications,
      :managed_customers
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
