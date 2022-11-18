# frozen_string_literal: true
module MasterControl
  module Models
    class CustomerAppTask < MasterControl::Models::Base
      attributes \
        :id,
        :customer_id,
        :app_icon_id,
        :app_model_id,
        :app_state_id,
        :app_task_id,
        :app_url_id,
        :completion_app_state_id,
        :completion_customer_app_state_id,
        :customer_app_notification_id,
        :due_in,
        :grace_period,
        :ib_application_id,
        :is_owner_assigned,
        :is_sync_update,
        :name,
        :priority_level,
        :system_code,
        :task_model_id,
        :use_owner_as_assignee,
        :work_group_id,
        :version,
        :work_group_id,
        :created_at,
        :updated_at,
        :updated_by_id,
        :created_by_id,
        :active


      class << self
        # rubocop:disable Metrics/MethodLength
        def json_schema
          {
            type: 'object',
            properties: {
              id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              canonical_klass: { type: 'string' },
              master_control_version: { type: 'string' },
              version: { type: 'integer' },
              active: { type: 'boolean' },
              customer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              app_icon_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              app_model_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              app_state_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              app_task_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              app_url_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              completion_app_state_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              completion_customer_app_state_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_app_notification_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              due_in: { type: 'integer' },
              grace_period: { type: 'integer' },
              ib_application_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              is_owner_assigned: { type: 'boolean' },
              is_sync_update: { type: 'boolean' },
              name: { type: 'string' },
              priority_level: { type: 'integer' },
              system_code: { type: 'string' },
              task_model_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              use_owner_as_assignee: { type: 'boolean' },
              work_group_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              created_at: { type: 'string', format: 'date-time' },
              updated_at: { type: 'string', format: 'date-time' },
              updated_by_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              created_by_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] }
            },
            required: [
              :canonical_klass,
              :master_control_version,
              :is_sync_update,
              :version,
              :id,
              :active,
              :customer_id,
              :app_icon_id,
              :app_model_id,
              :app_state_id,
              :app_task_id,
              :app_url_id,
              :completion_app_state_id,
              :completion_customer_app_state_id,
              :due_in,
              :grace_period,
              :ib_application_id,
              :is_owner_assigned,
              :name,
              :priority_level,
              :system_code,
              :task_model_id,
              :use_owner_as_assignee,
              :work_group_id,
              :created_at,
              :updated_at,
              :updated_by_id,
              :created_by_id
            ],
            additionalProperties: false
          }.to_json
        end
        # rubocop:enable Metrics/MethodLength
      end
    end
  end
end
