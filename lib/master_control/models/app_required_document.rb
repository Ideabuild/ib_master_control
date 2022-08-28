# frozen_string_literal: true
module MasterControl
  module Models
    class AppRequiredDocument < MasterControl::Models::Base
      attributes \
        :id,
        :app_state_id,
        :base_model_id,
        :date_column_id,
        :document_due_by_type_id,
        :document_model_id,
        :document_requirement_type_id,
        :document_type_id,
        :due_by_days,
        :name,
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
              app_state_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              base_model_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              date_column_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              document_due_by_type_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              document_model_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              document_requirement_type_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              date_column_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              document_type_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              due_by_days: { type: 'integer' }, 
              name: { type: 'string' },
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
              :app_state_id,
              :base_model_id,
              :date_column_id,
              :document_due_by_type_id,
              :document_model_id,
              :document_requirement_type_id,
              :document_type_id,
              :due_by_days,
              :name,
              :system_code,
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
