# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::AppStateTimer do
  NULLEABLE_ATTRIBUTES = [].freeze

  let(:canonical_klass) { 'MasterControl::Models::AppStateTimer' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:app_event_id) { SecureRandom.uuid }
  let(:app_model_id) { SecureRandom.uuid }
  let(:criteria_column_id) { SecureRandom.uuid }
  let(:criteria_type_name) { 'A Name' }
  let(:criteria_type_system_code) { 'a_code' }
  let(:app_state_id) { SecureRandom.uuid }
  let(:data_type) { 'datetime' }
  let(:name) { 'A Name' }
  let(:range_limit) { 40 }
  let(:system_code) { 'the_code' }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:app_state_timer) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      app_event_id: app_event_id,
      app_model_id: app_model_id,
      criteria_column_id: criteria_column_id,
      criteria_type_name: criteria_type_name,
      criteria_type_system_code: criteria_type_system_code,
      app_state_id: app_state_id,
      data_type: data_type,
      name: name,
      range_limit: range_limit,
      system_code: system_code,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::AppStateTimer.json_schema, app_state_timer)
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
      :app_event_id,
      :app_model_id,
      :criteria_column_id,
      :criteria_type_name,
      :criteria_type_system_code,
      :app_state_id,
      :data_type,
      :name,
      :range_limit,
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
