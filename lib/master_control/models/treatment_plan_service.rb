# frozen_string_literal: true
module MasterControl
  module Models
    class TreatmentPlanService < MasterControl::Models::Base
      attributes  \
        :id,
        :treatment_plan_id,
        :customer_service_id,
        :proposed_service_total,
        :proposed_services_per_week,
        :current_approved_services_per_week,
        :current_approved_services_total,
        :total_approved_services_per_week,
        :total_approved_services,
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
              canonical_klass: { type: 'string' },
              master_control_version: { type: 'string' },
              is_sync_update: { type: 'boolean' },
              version: { type: 'integer' },
              active: { type: 'boolean' },
              id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              treatment_plan_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_service_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              proposed_service_total: { type: 'integer' },
              proposed_services_per_week: { type: 'integer' },
              current_approved_services_per_week: { type: ['integer', 'null'] },
              current_approved_services_total: { type: ['integer', 'null'] },
              total_approved_services_per_week: { type: ['integer', 'null'] },
              total_approved_services: { type: ['integer', 'null'] },
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
              :treatment_plan_id,
              :customer_service_id,
              :proposed_service_total,
              :proposed_services_per_week,
              :proposed_started_at,
              :estimated_end_at,
              :aasm_state,
              :has_state_event,
              :created_at,
              :updated_at,
              :updated_by_id,
              :created_by_id,
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
