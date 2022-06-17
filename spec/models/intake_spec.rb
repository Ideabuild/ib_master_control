# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::Intake do
  NULLEABLE_ATTRIBUTES = [
    :treatment_plan_id,
    :external_reference_identifier,
    :customer_app_state_id
  ].freeze

  let(:canonical_klass) { 'MasterControl::Models::Intake' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:aasm_state) { 'a_state' }
  let(:customer_id) { SecureRandom.uuid }
  let(:customer_app_state_id) { SecureRandom.uuid }
  let(:entered_by_id) { SecureRandom.uuid }
  let(:entered_at) { Time.now.to_s(:iso8601) }
  let(:external_reference_identifier) { 'reference' }
  let(:facility_id) { SecureRandom.uuid }
  let(:intake_type_name) { 'Verification' }
  let(:intake_type_system_code) { 'verification' }
  let(:patient_id) { SecureRandom.uuid }
  let(:treatment_plan_id) { SecureRandom.uuid }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:intake) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      aasm_state: aasm_state,
      customer_id: customer_id,
      customer_app_state_id: customer_app_state_id,
      entered_by_id: entered_by_id,
      entered_at: entered_at,
      external_reference_identifier: external_reference_identifier,
      facility_id: facility_id,
      intake_type_name: intake_type_name,
      intake_type_system_code: intake_type_system_code,
      patient_id: patient_id,
      treatment_plan_id: treatment_plan_id,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::Intake.json_schema, intake)
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
      :customer_id,
      :entered_by_id,
      :entered_at,
      :facility_id,
      :intake_type_name,
      :intake_type_system_code,
      :patient_id,
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
