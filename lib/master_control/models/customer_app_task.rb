# frozen_string_literal: true
module MasterControl
  module Models
    class CustomerAppTask < MasterControl::Models::Base
      attributes \
        :id,
        :app_model_id,
        :app_state_id,
        :app_task_id,
        :customer_app_notification_id,
        :customer_id,
        :due_in,
        :grace_period,
        :icon,
        :ib_application_id,
        :is_owner_assigned,
        :is_sync_update,
        :name,
        :priority_level,
        :system_code,
        :task_model_id,
        :url,
        :use_owner_as_assignee,
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
              app_task_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              app_model_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              app_state_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_app_notification_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              due_in: { type: 'integer' },
              ib_application_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              icon: { type: 'string' },
              is_owner_assigned: { type: ['boolean', 'null'] },
              is_sync_update: { type: 'boolean' },
              name: { type: 'string' },
              grace_period: { type: 'integer' },
              priority_level: { type: 'integer' },
              system_code: { type: 'string' },
              task_model_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              url: { type: 'string' },
              use_owner_as_assignee: { type: ['boolean', 'null'] },
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
