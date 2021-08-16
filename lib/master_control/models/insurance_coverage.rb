# frozen_string_literal: true
module MasterControl
  module Models
    class InsuranceCoverage < MasterControl::Models::Base
      attributes  \
        :id,
        :customer_id,
        :patient_id,
        :customer_provider_id,
        :insurance_sequence_id,
        :carrier_id,
        :policy_holder_first_name,
        :policy_holder_middle_name,
        :policy_holder_last_name,
        :policy_holder_date_of_birth,
        :member_id,
        :group_number,
        :aasm_state,
        :is_valid,
        :last_validated_at,
        :insurance_position,
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
              customer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              patient_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_provider_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              insurance_sequence_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              carrier_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              policy_holder_first_name: { type: 'string' },
              policy_holder_middle_name: { type: ['string', 'null'] },
              policy_holder_last_name: { type: 'string' },
              policy_holder_date_of_birth: { type: 'string', format: 'date' },
              member_id: { type: 'string' },
              group_number: { type: 'string' },
              aasm_state: { type: 'string' },
              is_valid: { type: 'boolean' },
              last_validated_at: { type: 'string', format: 'date' },
              insurance_position: { type: 'integer' },
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
              :customer_id,
              :patient_id,
              :customer_provider_id,
              :insurance_sequence_id,
              :carrier_id,
              :policy_holder_first_name,
              :policy_holder_last_name,
              :policy_holder_date_of_birth,
              :member_id,
              :group_number,
              :aasm_state,
              :is_valid,
              :insurance_position,
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
