# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::CustomerAppTask do
  NULLEABLE_ATTRIBUTES = [
    :is_owner_assigned,
    :use_owner_as_assignee
  ].freeze

  let(:canonical_klass) { 'MasterControl::Models::CustomerAppTask' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:app_task_id) { SecureRandom.uuid }
  let(:app_model_id) { SecureRandom.uuid }
  let(:app_state_id) { SecureRandom.uuid }
  let(:customer_app_notification_id) { SecureRandom.uuid }
  let(:customer_id) { SecureRandom.uuid }
  let(:due_in) { 3 }
  let(:grace_period) { 1 }
  let(:ib_application_id) { SecureRandom.uuid }
  let(:icon) { 'icon' }
  let(:is_owner_assigned) { true }
  let(:name) { 'A Name' }
  let(:priority_level) { 3 }
  let(:system_code) { 'the_code' }
  let(:task_model_id) { SecureRandom.uuid }
  let(:url) { '/ads/aghg/sssa' }
  let(:use_owner_as_assignee) { true }
  let(:work_group_id) { SecureRandom.uuid }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:customer_app_task) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      app_task_id: app_task_id,
      app_model_id: app_model_id,
      app_state_id: app_state_id,
      customer_app_notification_id: customer_app_notification_id,
      customer_id: customer_id,
      due_in: due_in,
      ib_application_id: ib_application_id,
      icon: icon,
      is_owner_assigned: is_owner_assigned,
      grace_period: grace_period,
      name: name,
      priority_level: priority_level,
      system_code: system_code,
      task_model_id: task_model_id,
      url: url,
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
    JSON::Validator.validate!(MasterControl::Models::CustomerAppTask.json_schema, customer_app_task)
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
      :customer_id,
      :app_task_id,
      :app_model_id,
      :app_state_id,
      :work_group_id,
      :task_model_id,
      :ib_application_id,
      :name,
      :system_code,
      :icon,
      :url,
      :grace_period,
      :due_in,
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
