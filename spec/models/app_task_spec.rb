# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::AppTask do
  NULLEABLE_ATTRIBUTES = [].freeze

  let(:canonical_klass) { 'MasterControl::Models::AppTask' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:app_icon_id) { SecureRandom.uuid }
  let(:app_model_id) { SecureRandom.uuid }
  let(:app_notification_id) { SecureRandom.uuid }
  let(:app_state_id) { SecureRandom.uuid }
  let(:app_url_id) { SecureRandom.uuid }
  let(:completion_states) { [{ id: SecureRandom.uuid, name: 'pending' }] }
  let(:due_in) { 12 }
  let(:grace_period) { 2 }
  let(:ib_application_id) { SecureRandom.uuid }
  let(:is_owner_assigned) { true }
  let(:name) { 'A name' }
  let(:system_code) { 'the_code' }
  let(:task_model_id) { SecureRandom.uuid }
  let(:use_owner_as_assignee) { true }
  let(:work_group_id) { SecureRandom.uuid }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:app_task) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      app_icon_id: app_icon_id,
      app_model_id: app_model_id,
      app_notification_id: app_notification_id,
      app_state_id: app_state_id,
      app_url_id: app_url_id,
      completion_states: completion_states,
      due_in: due_in,
      grace_period: grace_period,
      ib_application_id: ib_application_id,
      is_owner_assigned: is_owner_assigned,
      name: name,
      system_code: system_code,
      task_model_id: task_model_id,
      use_owner_as_assignee: use_owner_as_assignee,
      work_group_id: work_group_id,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::AppTask.json_schema, app_task)
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
      :app_icon_id,
      :app_model_id,
      :app_state_id,
      :app_url_id,
      :completion_states,
      :due_in,
      :grace_period,
      :ib_application_id,
      :is_owner_assigned,
      :name,
      :system_code,
      :task_model_id,
      :use_owner_as_assignee,
      :work_group_id,
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
