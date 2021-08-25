# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::Carrier do
  NULLEABLE_ATTRIBUTES = [].freeze

  let(:canonical_klass) { 'MasterControl::Models::Carrier' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:customer_app_state_id) { SecureRandom.uuid }
  let(:name) { 'Billing' }
  let(:aasm_state) { 'active' }
  let(:carrier_type_name) { 'Evil' }
  let(:carrier_type_system_code) { 'evil_code' }
  let(:carrier_family_name) { 'Greedy' }
  let(:carrier_family_system_code) { 'greedy_code' }
  let(:has_state_event) { true }
  let(:state_event) { 'update_state!' }
  let(:phone_number) { '(707) 555-5555' }
  let(:fax_number) { '(707) 555-5555' }
  let(:email) { 'ideabuild@happy.com' }
  let(:url) { '/boo/foo' }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:carrier) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      customer_app_state_id: customer_app_state_id,
      name: name,
      aasm_state: aasm_state,
      carrier_type_name: carrier_type_name,
      carrier_type_system_code: carrier_type_system_code,
      carrier_family_name: carrier_family_name,
      carrier_family_system_code: carrier_family_system_code,
      has_state_event: has_state_event,
      state_event: state_event,
      phone_number: phone_number,
      fax_number: fax_number,
      email: email,
      url: url,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::Carrier.json_schema, carrier)
  end

  context 'happy path' do
    specify { expect { validate! }.to_not raise_error }
  end

  describe 'required attributes (not nil)' do
    [
      :canonical_klass,
      :id,
      :master_control_version,
      :is_sync_update,
      :version,
      :customer_app_state_id,
      :name,
      :aasm_state,
      :carrier_type_name,
      :carrier_type_system_code,
      :carrier_family_name,
      :carrier_family_system_code,
      :has_state_event,
      :created_at,
      :updated_at,
      :updated_by_id,
      :created_by_id
    ].each do |attribute|
      context attribute do
        let(attribute) { nil }

        specify { expect { validate! }.to raise_error JSON::Schema::ValidationError }
      end
    end
  end

  context 'nullable attributes' do
    NULLEABLE_ATTRIBUTES.each do |attribute|
      context attribute do
        let(attribute) { nil }

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
