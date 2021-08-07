# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::WorkQueueRuleCriteria do
  NULLEABLE_ATTRIBUTES = [].freeze

  let(:canonical_klass) { 'MasterControl::Models::WorkQueueRuleCriteria' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:work_queue_rule_id) { SecureRandom.uuid }
  let(:name) { 'A Name' }
  let(:system_code) { 'the_code' }
  let(:use_model_association) { true }
  let(:criteria_app_model_association_id) { SecureRandom.uuid }
  let(:criteria_column_id) { SecureRandom.uuid }
  let(:criteria_value) { 'the_code' }
  let(:criteria_type_id) { SecureRandom.uuid }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:work_queue_rule_criteria) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      work_queue_rule_id: work_queue_rule_id,
      name: name,
      system_code: system_code,
      use_model_association: use_model_association,
      criteria_app_model_association_id: criteria_app_model_association_id,
      criteria_column_id: criteria_column_id,
      criteria_value: criteria_value,
      criteria_type_id: criteria_type_id,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::WorkQueueRuleCriteria.json_schema, work_queue_rule_criteria)
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
      :name,
      :system_code,
      :work_queue_rule_id,
      :use_model_association,
      :criteria_app_model_association_id,
      :criteria_column_id,
      :criteria_value,
      :criteria_type_id,
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
