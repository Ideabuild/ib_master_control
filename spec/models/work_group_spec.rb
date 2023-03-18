# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::WorkGroup do
  NULLEABLE_ATTRIBUTES = [].freeze

  let(:canonical_klass) { 'MasterControl::Models::WorkGroup' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:app_area_id) { SecureRandom.uuid }
  let(:app_model_id) { SecureRandom.uuid }
  let(:ib_application_id) { SecureRandom.uuid }
  let(:is_managed) { Faker::Boolean.boolean }
  let(:name) { 'A Name' }
  let(:system_code) { 'the_code' }
  let(:task_app_model_id) { SecureRandom.uuid }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:work_group) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      app_area_id: app_area_id,
      app_model_id: app_model_id,
      ib_application_id: ib_application_id,
      is_managed: is_managed,
      name: name,
      system_code: system_code,
      task_app_model_id: task_app_model_id,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::WorkGroup.json_schema, work_group)
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
      :app_area_id,
      :app_model_id,
      :ib_application_id,
      :is_managed,
      :name,
      :system_code,
      :task_app_model_id,
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
