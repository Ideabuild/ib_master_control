# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::InsuranceCoverage do
  NULLEABLE_ATTRIBUTES = [
    :group_number,
    :state_event,
    :policy_holder_middle_name
  ].freeze

  let(:canonical_klass) { 'MasterControl::Models::InsuranceCoverage' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:customer_id) { SecureRandom.uuid }
  let(:patient_id) { SecureRandom.uuid }
  let(:customer_provider_id) { SecureRandom.uuid }
  let(:insurance_sequence_id) { SecureRandom.uuid }
  let(:carrier_id) { SecureRandom.uuid }
  let(:policy_holder_first_name) { 'Billing' }
  let(:policy_holder_middle_name) { 'Billing' }
  let(:policy_holder_last_name) { 'Billing' }
  let(:policy_holder_date_of_birth) { Time.now.to_s(:iso8601) }
  let(:member_id) { 'Billing' }
  let(:group_number) { 'Billing' }
  let(:aasm_state) { 'Billing' }
  let(:insurance_position) { 1 }
  let(:has_state_event) { true }
  let(:state_event) { 'update_state!' }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:insurance_coverage) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      customer_id: customer_id,
      patient_id: patient_id,
      customer_provider_id: customer_provider_id,
      insurance_sequence_id: insurance_sequence_id,
      carrier_id: carrier_id,
      policy_holder_first_name: policy_holder_first_name,
      policy_holder_middle_name: policy_holder_middle_name,
      policy_holder_last_name: policy_holder_last_name,
      policy_holder_date_of_birth: policy_holder_date_of_birth,
      member_id: member_id,
      group_number: group_number,
      aasm_state: aasm_state,
      insurance_position: insurance_position,
      has_state_event: has_state_event,
      state_event: state_event,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::InsuranceCoverage.json_schema, insurance_coverage)
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
      :customer_id,
      :patient_id,
      :insurance_sequence_id,
      :carrier_id,
      :policy_holder_first_name,
      :policy_holder_last_name,
      :policy_holder_date_of_birth,
      :member_id,
      :aasm_state,
      :insurance_position,
      :has_state_event,
      :created_at,
      :updated_at,
      :updated_by_id,
      :created_by_id,
      :active
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
