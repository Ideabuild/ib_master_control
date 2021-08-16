# frozen_string_literal: true
module MasterControl
  module Models
    class TreatmentPlanDocument < MasterControl::Models::Base
      attributes \
        :id,
        :treatment_plan_id,
        :s3_bucket,
        :s3_object_key,
        :document_name,
        :document_type_name,
        :document_type_system_code,
        :has_state_event,
        :state_event,
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
              treatment_plan_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              s3_bucket: { type: ['string', 'null'] },
              s3_object_key: { type: 'string' },
              document_name: { type: 'string' },
              document_type_name: { type: 'string' },
              document_type_system_code: { type: 'string' },
              has_state_event: { type: 'boolean' },
              state_event: { type: 'string' },
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
              :active,
              :treatment_plan_id,
              :s3_object_key,
              :document_name,
              :document_type_name,
              :document_type_system_code,
              :has_state_event,
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
