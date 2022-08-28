# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::AppRequiredDocument do
  NULLEABLE_ATTRIBUTES = [].freeze

  let(:canonical_klass) { 'MasterControl::Models::AppRequiredDocument' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:app_state_id) { SecureRandom.uuid }
  let(:base_model_id) { SecureRandom.uuid }
  let(:date_column_id) { SecureRandom.uuid }
  let(:document_due_by_type_id) { SecureRandom.uuid }
  let(:document_model_id) { SecureRandom.uuid }
  let(:document_requirement_type_id) { SecureRandom.uuid }
  let(:document_type_id) { SecureRandom.uuid }
  let(:due_by_days) { 40 }
  let(:name) { 'A Name' }
  let(:system_code) { 'the_code' }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:app_required_document) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      app_state_id: app_state_id,
      base_model_id: base_model_id,
      date_column_id: date_column_id,
      document_due_by_type_id: document_due_by_type_id,
      document_model_id: document_model_id,
      document_requirement_type_id: document_requirement_type_id,
      document_type_id: document_type_id,
      due_by_days: due_by_days,
      name: name,
      system_code: system_code,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::AppRequiredDocument.json_schema, app_required_document)
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
      :app_state_id,
      :base_model_id,
      :date_column_id,
      :document_due_by_type_id,
      :document_model_id,
      :document_requirement_type_id,
      :document_type_id,
      :due_by_days,
      :name,
      :system_code,
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
