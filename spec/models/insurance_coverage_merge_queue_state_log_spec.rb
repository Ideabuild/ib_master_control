# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::InsuranceCoverageMergeQueueStateLog do
  NULLEABLE_ATTRIBUTES = [
    :state_out_at,
    :time_in_state
  ].freeze

  let(:canonical_klass) { 'MasterControl::Models::InsuranceCoverageMergeQueueStateLog' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:insurance_coverage_merge_queue_id) { SecureRandom.uuid }
  let(:is_auto_completed) {false }
  let(:logged_aasm_state) { 'a_state' }
  let(:state_in_at) { Time.now.to_s(:iso8601) }
  let(:state_out_at) { Time.now.to_s(:iso8601) }
  let(:time_in_state) { 0 }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:insurance_coverage_merge_queue_state_logs) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      insurance_coverage_merge_queue_id: insurance_coverage_merge_queue_id,
      is_auto_completed: is_auto_completed,
      logged_aasm_state: logged_aasm_state,
      state_in_at: state_in_at,
      state_out_at: state_out_at,
      time_in_state: time_in_state,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::InsuranceCoverageMergeQueueStateLog.json_schema, insurance_coverage_merge_queue_state_logs)
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
      :insurance_coverage_merge_queue_id,
      :logged_aasm_state,
      :state_in_at,
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
