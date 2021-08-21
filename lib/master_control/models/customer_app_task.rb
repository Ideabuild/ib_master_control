# frozen_string_literal: true
module MasterControl
  module Models
    class CustomerAppTask < MasterControl::Models::Base
      attributes \
        :id,
        :customer_id,
        :app_task_id,
        :app_model_id,
        :app_state_id,
        :customer_app_notification_id,
        :work_group_id,
        :task_model_id,
        :name,
        :system_code,
        :icon,
        :url,
        :grace_period,
        :due_in,
        :priority_level,
        :version,
        :is_sync_update,
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
              is_sync_update: { type: 'boolean' },
              version: { type: 'integer' },
              active: { type: 'boolean' },
              customer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              app_task_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              app_model_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              app_state_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_app_notification_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              work_group_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              task_model_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              name: { type: 'string' },
              system_code: { type: 'string' },
              icon: { type: 'string' },
              url: { type: 'string' },
              grace_period: { type: 'integer' },
              due_in: { type: 'integer' },
              priority_level: { type: 'integer' },
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
              :app_task_id,
              :app_model_id,
              :app_state_id,
              :customer_app_notification_id,
              :work_group_id,
              :task_model_id,
              :name,
              :system_code,
              :icon,
              :url,
              :grace_period,
              :due_in,
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
