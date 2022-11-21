# frozen_string_literal: true
module MasterControl
  module Models
    class CustomerAppStateTimer < MasterControl::Models::Base
      attributes \
        :id,
        :app_event_id,
        :app_model_id,
        :criteria_column_id,
        :criteria_type_name,
        :criteria_type_system_code,
        :customer_app_state_id,
        :customer_id,
        :data_type,
        :name,
        :range_limit,
        :system_code,
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
              app_event_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              app_model_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              criteria_column_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              criteria_type_name: { type: 'string' },
              criteria_type_system_code: { type: 'string' },
              customer_app_state_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              data_type: { type: 'string' },
              name: { type: 'string' },
              system_code: { type: 'string' },
              range_limit: { type: 'integer' },
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
              :app_event_id,
              :app_model_id,
              :criteria_column_id,
              :criteria_type_name,
              :criteria_type_system_code,
              :customer_app_state_id,
              :customer_id,
              :data_type,
              :name,
              :system_code,
              :range_limit,
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
