# frozen_string_literal: true
module MasterControl
  module Models
    class WorkQueueRuleCriterium < MasterControl::Models::Base
      attributes \
        :id,
        :work_queue_rule_id,
        :name,
        :system_code,
        :use_model_association,
        :criteria_app_model_association_id,
        :criteria_column_id,
        :criteria_value,
        :criteria_type_name,
        :criteria_type_system_code,
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
              name: { type: 'string' },
              system_code: { type: 'string' },
              work_queue_rule_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              use_model_association: { type: 'boolean' },
              criteria_app_model_association_id:  { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              criteria_column_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              criteria_value: { type: 'string' },
              criteria_type_name: { type: 'string'  },
              criteria_type_system_code: { type: 'string'  },
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
              :name,
              :system_code,
              :work_queue_rule_id,
              :use_model_association,
              :criteria_column_id,
              :criteria_value,
              :criteria_type_name,
              :criteria_type_system_code,
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
