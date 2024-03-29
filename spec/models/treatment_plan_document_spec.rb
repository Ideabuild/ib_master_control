# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::TreatmentPlanDocument do
  NULLEABLE_ATTRIBUTES = [].freeze

  let(:canonical_klass) { 'MasterControl::Models::TreatmentPlanDocument' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:treatment_plan_id) { SecureRandom.uuid }
  let(:s3_bucket) { 'Billing' }
  let(:s3_object_key) { 'patient' }
  let(:document_name) { 'patient' }
  let(:document_type_name) { 'patient' }
  let(:document_type_system_code) { 'patient' }
  let(:has_state_event) { true }
  let(:state_event) { 'update_state!' }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:treatment_plan_document) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      treatment_plan_id: treatment_plan_id,
      s3_bucket: s3_bucket,
      s3_object_key: s3_object_key,
      document_name: document_name,
      document_type_name: document_type_name,
      document_type_system_code: document_type_system_code,
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
    JSON::Validator.validate!(MasterControl::Models::TreatmentPlanDocument.json_schema, treatment_plan_document)
  end

  context 'happy path' do
    specify { expect { validate! }.to_not raise_error }
  end

  describe 'required attributes (not nil)' do
    [
      :canonical_klass,
      :is_sync_update,
      :id,
      :version,
      :active,
      :treatment_plan_id,
      :s3_object_key,
      :document_name,
      :document_type_name,
      :document_type_system_code,
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
