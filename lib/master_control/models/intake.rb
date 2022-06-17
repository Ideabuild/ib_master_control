# frozen_string_literal: true
module MasterControl
  module Models
    class Intake < MasterControl::Models::Base
      attributes \
        :id,
        :aasm_state,
        :customer_id,
        :customer_app_state_id,
        :entered_by_id,
        :entered_at,
        :external_reference_identifier,
        :facility_id,
        :intake_type_name,
        :intake_type_system_code,
        :patient_id,
        :treatment_plan_id,
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
              aasm_state: { type: 'string' },
              customer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_app_state_id: {  type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              entered_by_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              entered_at: { type: 'string', format: 'date-time' },
              external_reference_identifier: {  type: ['string', 'null'] },
              facility_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              intake_type_name: { type: 'string' },
              intake_type_system_code: { type: 'string' },
              patient_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              treatment_plan_id: {  type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
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
              :aasm_state,
              :customer_id,
              :entered_by_id,
              :entered_at,
              :facility_id,
              :intake_type_name,
              :intake_type_system_code,
              :patient_id,
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
