# frozen_string_literal: true
module MasterControl
  module Models
    class TreatmentPlan < MasterControl::Models::Base
      attributes  \
        :id,
        :intake_id,
        :customer_id,
        :patient_id,
        :facility_id,
        :referring_provider_id,
        :treating_provider_id,
        :customer_service_line_id,
        :backup_service_line_id,
        :proposed_duration,
        :current_approved_duration,
        :total_approved_duration,
        :duration_qualifier_id,
        :proposed_started_at,
        :actual_started_at,
        :estimated_end_at,
        :actual_end_at,
        :review_documents_required_at,
        :initial_auhorization_at,
        :current_auhorization_at,
        :current_authorization_number,
        :current_auhorization_expires_at,
        :aasm_state,
        :version,
        :is_sync_update,
        :created_at,
        :updated_at,
        :created_at,
        :updated_at,
        :active

      class << self
        # rubocop:disable Metrics/MethodLength
        def json_schema
          {
            type: 'object',
            properties: {
              canonical_klass: { type: 'string' },
              master_control_version: { type: 'string' },
              is_sync_update: { type: 'boolean' },
              version: { type: 'integer' },
              active: { type: 'boolean' },
              id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              intake_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              patient_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              facility_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              referring_provider_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              treating_provider_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_service_line_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              backup_service_line_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              proposed_duration: { type: 'integer' },
              current_approved_duration: { type: ['integer', 'null'] },
              total_approved_duration: { type: ['integer', 'null'] },
              duration_qualifier_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              proposed_started_at: { type: 'string', format: 'date' },
              actual_started_at: { type: ['string', 'null'], format: 'date' },
              estimated_end_at: { type: 'string', format: 'date' },
              actual_end_at: { type: ['string', 'null'], format: 'date' },
              review_documents_required_at: { type: ['string', 'null'], format: 'date' },
              initial_auhorization_at: { type: ['string', 'null'], format: 'date' },
              current_auhorization_at: { type: ['string', 'null'], format: 'date' },
              current_authorization_number: { type: ['string', 'null'] },
              current_auhorization_expires_at: { type: ['string', 'null'], format: 'date' },
              aasm_state: { type: 'string' },
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
              :intake_id,
              :customer_id,
              :patient_id,
              :facility_id,
              :referring_provider_id,
              :customer_service_line_id,
              :proposed_duration,
              :duration_qualifier_id,
              :proposed_started_at,
              :estimated_end_at,
              :aasm_state,
              :created_at,
              :updated_at,
              :active
            ],
            additionalProperties: false
          }.to_json
        end
        # rubocop:enable Metrics/MethodLength
      end
    end
  end
end
