# frozen_string_literal: true
module MasterControl
  module Models
    class CustomerAppRequiredDocument < MasterControl::Models::Base
      attributes \
        :id,
        :customer_id,
        :document_requirement_type_name,
        :document_requirement_type_system_code,
        :document_due_by_type_name,
        :document_due_by_type_system_code,
        :document_model_id,
        :document_type_id,
        :base_model_id,
        :app_state_id,
        :customer_app_state_id,
        :date_column_id,
        :name,
        :system_code,
        :due_by_days,
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
              document_model_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              base_model_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              app_state_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_app_state_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              date_column_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              document_requirement_type_name: { type: 'string' },
              document_requirement_type_system_code: { type: 'string' },
              document_due_by_type_name: { type: 'string' },
              document_due_by_type_system_code: { type: 'string' },
              document_type_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              name: { type: 'string' },
              system_code: { type: 'string' },
              due_by_days: { type: 'integer' },
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
              :document_model_id,
              :base_model_id,
              :app_state_id,
              :customer_app_state_id,
              :name,
              :system_code,
              :due_by_days,
              :document_requirement_type_name,
              :document_requirement_type_system_code,
              :document_type_id,
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
