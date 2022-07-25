# frozen_string_literal: true
module MasterControl
  module Models
    class InsuranceCoverage < MasterControl::Models::Base
      attributes  \
        :id,
        :aasm_state,
        :carrier_id,
        :customer_id,
        :customer_app_state_id,
        :customer_provider_id,
        :group_number,
        :has_state_event,
        :insurance_position,
        :insurance_sequence_id,
        :intake_id,
        :is_cobra,
        :is_valid,
        :is_verified,
        :last_validated_at,
        :last_verified_at,
        :member_id,
        :patient_id,
        :policy_holder_id,
        :policy_holder_first_name,
        :policy_holder_middle_name,
        :policy_holder_last_name,
        :policy_holder_date_of_birth,
        :set_for_verification,
        :set_for_discovery,
        :state_event,
        :verified_by_id,
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
              aasm_state: { type: 'string' },
              carrier_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_app_state_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_provider_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              group_number: { type: ['string', 'null'] },
              has_state_event: { type: 'boolean' },
              insurance_position: { type: 'integer' },
              insurance_sequence_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              intake_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              is_cobra: { type: 'boolean' },
              is_valid: { type: ['boolean', 'null'] },
              is_verified: { type: ['boolean', 'null'] },
              last_validated_at: { type: ['string', 'null'], format: 'date-time' },
              last_verified_at: { type: ['string', 'null'], format: 'date-time' },
              member_id: { type: 'string' },
              patient_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              policy_holder_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              policy_holder_first_name: { type: 'string' },
              policy_holder_middle_name: { type: ['string', 'null'] },
              policy_holder_last_name: { type: 'string' },
              policy_holder_date_of_birth: { type: 'string', format: 'date' },
              set_for_verification: { type: 'boolean' },
              set_for_discovery: { type: 'boolean' },
              state_event: { type: ['string', 'null'] },
              verified_by_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid]  },
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
              :aasm_state,
              :carrier_id,
              :customer_id,
              :customer_provider_id,
              :group_number,
              :insurance_position,
              :is_cobra,
              :member_id,
              :patient_id,
              :policy_holder_first_name,
              :policy_holder_last_name,
              :policy_holder_date_of_birth,
              :set_for_verification,
              :set_for_discovery,
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
