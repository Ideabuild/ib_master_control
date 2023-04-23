# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::PatientMergeQueue do
  NULLEABLE_ATTRIBUTES = [
    :customer_app_state_id,
    :merged_by_id,
    :merged_at,
    :notes
  ].freeze

  let(:canonical_klass) { 'MasterControl::Models::PatientMergeQueue' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:aasm_state) { "Employer One" }
  let(:customer_app_state_id) { SecureRandom.uuid }
  let(:customer_id) { SecureRandom.uuid }
  let(:merged_at) { Time.now.to_s(:iso8601) }
  let(:merged_by_id) { SecureRandom.uuid }
  let(:merged_patient_id) { SecureRandom.uuid }
  let(:notes) { "Employer One" }
  let(:patient_id) { SecureRandom.uuid }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:patient_merge_queue) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      aasm_state: aasm_state,
      customer_app_state_id: customer_app_state_id,
      customer_id: customer_id,
      merged_at: merged_at,
      merged_by_id: merged_by_id,
      merged_patient_id: merged_patient_id,
      notes: notes,
      patient_id: patient_id,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::PatientMergeQueue.json_schema, patient_merge_queue)
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
      :merged_patient_id,
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
