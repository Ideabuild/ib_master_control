# frozen_string_literal: true
module MasterControl
  module Models
    class AppTask < MasterControl::Models::Base
      attributes \
        :id,
        :app_icon_id,
        :app_model_id,
        :app_notification_id,
        :app_state_id,
        :app_url_id,
        :due_in,
        :ib_application_id,
        :is_owner_assigned,
        :grace_period,
        :name,
        :system_code,
        :task_model_id,
        :use_owner_as_assignee,
        :work_group_id,
        :version,
        :is_sync_update,
        :created_at,
        :updated_at,
        :updated_by_id,
        :created_by_id,
        :active

        attribute :completion_states

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
              app_icon_id: { type: ['string'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              app_model_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              app_notification_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              app_state_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              app_url_id: { type: ['string'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              completion_states: {
                type: 'array',
                items: {
                  type: 'object',
                  properties: {
                    id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
                    name: { type: 'string' }
                  }
                }
              },
              due_in: { type: 'integer' },
              grace_period: { type: 'integer' },
              is_owner_assigned: { type: 'boolean' },
              ib_application_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              name: { type: 'string' },
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
