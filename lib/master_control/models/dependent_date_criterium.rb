# frozen_string_literal: true
module MasterControl
  module Models
    class DependentDateCriterium < MasterControl::Models::Base
      attributes \
        :id,
        :criteria_app_model_association_id,
        :criteria_column_id,
        :criteria_type_name,
        :criteria_type_system_code,
        :criteria_value,
        :customer_id,
        :dependent_date_id,
        :name,
        :system_code,
        :use_model_association,
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
              criteria_app_model_association_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              criteria_column_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              criteria_type_name: { type: 'string' },
              criteria_type_system_code: { type: 'string' },
              criteria_value: { type: 'string' },
              customer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              dependent_date_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              name: { type: 'string' },
              system_code: { type: 'string' },
              use_model_association: { type: 'boolean' },
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
              :criteria_column_id,
              :criteria_type_name,
              :criteria_type_system_code,
              :criteria_value,
              :customer_id,
              :dependent_date_id,
              :name,
              :system_code,
              :use_model_association,
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
