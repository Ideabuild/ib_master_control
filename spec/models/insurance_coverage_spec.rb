# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::InsuranceCoverage do
  NULLEABLE_ATTRIBUTES = [
    :carrier_name,
    :cobra_inquiry_requested_at,
    :cobra_inquiry_requested_by_id,
    :cobra_follow_up_at,
    :cobra_follow_up_count,
    :cobra_insurance_coverage_id,
    :customer_app_state_id,
    :effective_at,
    :group_number,
    :intake_id,
    :is_valid,
    :is_verified,
    :last_validated_at,
    :last_verified_at,
    :other_carrier,
    :parent_insurance_coverage_id,
    :policy_holder_middle_name,
    :primary_ended_at,
    :primary_started_at,
    :termed_at,
    :state_event,
    :verified_by_id
  ].freeze

  let(:canonical_klass) { 'MasterControl::Models::InsuranceCoverage' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:aasm_state) { 'Billing' }
  let(:carrier_id) { SecureRandom.uuid }
  let(:carrier_name) { 'Billing' }
  let(:cobra_inquiry_requested_at) { Time.now.to_s(:iso8601) }
  let(:cobra_inquiry_requested_by_id) { SecureRandom.uuid }
  let(:cobra_follow_up_at) { Time.now.to_s(:iso8601) }
  let(:cobra_follow_up_count) { 10 }
  let(:cobra_insurance_coverage_id) { SecureRandom.uuid }
  let(:customer_id) { SecureRandom.uuid }
  let(:customer_app_state_id) { SecureRandom.uuid }
  let(:customer_provider_id) { SecureRandom.uuid }
  let(:effective_at) { Date.today.to_s }
  let(:group_number) { 'Billing' }
  let(:has_state_event) { true }
  let(:has_valid_consent_on_file) {false }
  let(:insurance_position) { 1 }
  let(:insurance_sequence_id) { SecureRandom.uuid }
  let(:intake_id) { SecureRandom.uuid }
  let(:is_carve_out) { false }
  let(:is_cobra) { false }
  let(:is_valid) { false }
  let(:is_verified) { false }
  let(:last_validated_at) { Time.now.to_s(:iso8601) }
  let(:last_verified_at) { Time.now.to_s(:iso8601) }
  let(:member_id) { 'Billing' }
  let(:other_carrier) { 'No Entered' }
  let(:parent_insurance_coverage_id) { SecureRandom.uuid }
  let(:patient_id) { SecureRandom.uuid }
  let(:policy_holder_id) { SecureRandom.uuid }
  let(:policy_holder_first_name) { 'Billing' }
  let(:policy_holder_middle_name) { 'Billing' }
  let(:policy_holder_last_name) { 'Billing' }
  let(:policy_holder_date_of_birth) { Time.now.to_s(:iso8601) }
  let(:primary_ended_at) { Date.today.to_s }
  let(:primary_started_at) { Date.today.to_s }
  let(:set_for_verification) { true }
  let(:set_for_discovery) { true }
  let(:state_event) { 'update_state!' }
  let(:termed_at) { Date.today.to_s }
  let(:verified_by_id) { SecureRandom.uuid }
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
      aasm_state: aasm_state,
      carrier_id: carrier_id,
      carrier_name: carrier_name,
      cobra_inquiry_requested_at: cobra_inquiry_requested_at,
      cobra_inquiry_requested_by_id: cobra_inquiry_requested_by_id,
      cobra_follow_up_at: cobra_follow_up_at,
      cobra_follow_up_count: cobra_follow_up_count,
      cobra_insurance_coverage_id: cobra_insurance_coverage_id,
      customer_app_state_id: customer_app_state_id,
      customer_id: customer_id,
      customer_provider_id: customer_provider_id,
      effective_at: effective_at,
      group_number: group_number,
      has_state_event: has_state_event,
      has_valid_consent_on_file: has_valid_consent_on_file,
      insurance_position: insurance_position,
      insurance_sequence_id: insurance_sequence_id,
      intake_id: intake_id,
      is_carve_out: is_carve_out,
      is_cobra: is_cobra,
      is_valid: is_valid,
      is_verified: is_verified,
      last_validated_at: last_validated_at,
      last_verified_at: last_verified_at,
      member_id: member_id,
      other_carrier: other_carrier,
      parent_insurance_coverage_id: parent_insurance_coverage_id,
      patient_id: patient_id,
      policy_holder_id: policy_holder_id,
      policy_holder_first_name: policy_holder_first_name,
      policy_holder_middle_name: policy_holder_middle_name,
      policy_holder_last_name: policy_holder_last_name,
      policy_holder_date_of_birth: policy_holder_date_of_birth,
      primary_ended_at: primary_ended_at,
      primary_started_at: primary_started_at,
      set_for_verification: set_for_verification,
      set_for_discovery: set_for_discovery,
      state_event: state_event,
      termed_at: termed_at,
      verified_by_id: verified_by_id,
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
      :aasm_state,
      :carrier_id,
      :customer_id,
      :has_state_event,
      :has_valid_consent_on_file,
      :is_carve_out,
      :is_cobra,
      :member_id,
      :patient_id,
      :set_for_verification,
      :set_for_discovery,
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
