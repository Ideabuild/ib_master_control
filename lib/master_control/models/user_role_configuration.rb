# frozen_string_literal: true
module MasterControl
  module Models
    class UserRoleConfiguration < MasterControl::Models::Base
      attributes \
        :id,
        :receive_role_notifications,
        :receive_role_messages,
        :receive_role_tasks,
        :role_id,
        :user_id,
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
              receive_role_notifications: { type: 'boolean' },
              receive_role_messages: { type: 'boolean' },
              receive_role_tasks: { type: 'boolean' },
              role_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              user_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              system_code: { type: 'string' },
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
              :receive_role_notifications,
              :receive_role_messages,
              :receive_role_tasks,
              :role_id,
              :user_id,
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
