# frozen_string_literal: true
module MasterControl
  module Models
    class WorkGroup < MasterControl::Models::Base
      attributes \
        :id,
        :app_area_id,
        :app_model_id,
        :ib_application_id,
        :is_managed,
        :name,
        :system_code,
        :task_app_model_id,
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
              app_area_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              app_model_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              ib_application_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              is_managed: { type: 'boolean' },
              name: { type: 'string' },
              system_code: { type: 'string' },
              task_app_model_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
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
