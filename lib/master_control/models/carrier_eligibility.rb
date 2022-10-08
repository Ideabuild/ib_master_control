# frozen_string_literal: true
module MasterControl
  module Models
    class CarrierEligibility < MasterControl::Models::Base
      attributes \
        :id,
        :aasm_state,
        :blue_ink_required,
        :carrier_identifier,
        :cpid,
        :eligibility_source_id,
        :enrollment_required,
        :enrollment_mandatory_fields,
        :enrollment_signature_required,
        :is_bcbs,
        :name,
        :pass_through_fee,
        :payer_id,
        :portal,
        :state_code,
        :state_id,
        :secondary_supported,
        :message,
        :version,
        :is_sync_update,
        :created_at,
        :updated_at,
        :updated_by_id,
        :created_by_id,
        :active

        attribute :carriers


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
              blue_ink_required: { type: 'boolean' },
              cpid: { type: 'string' },
              carrier_identifier: { type: 'string' },
              eligibility_source_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              enrollment_required: { type: 'boolean' },
              enrollment_mandatory_fields: { type: ['string', 'null'] },
              enrollment_signature_required: { type: 'boolean' },
              is_bcbs: { type: 'boolean' },
              message: { type: ['string', 'null'] },
              name: { type: 'string' },
              pass_through_fee: { type: ['number', 'null'] },
              payer_id: { type: 'string' },
              portal: { type: ['string', 'null'] },
              state_code: { type: ['string', 'null'] },
              state_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              secondary_supported: { type: 'boolean' },
              created_at: { type: 'string', format: 'date-time' },
              updated_at: { type: 'string', format: 'date-time' },
              updated_by_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              created_by_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              carriers: {
                type: 'array',
                items: {
                  type: 'object',
                  properties: {
                    id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
                    name: { type: 'string' }
                  }
                }
              },
            },
            required: [
              :canonical_klass,
              :master_control_version,
              :is_sync_update,
              :version,
              :id,
              :active,
              :aasm_state,
              :carrier_identifier,
              :cpid,
              :eligibility_source_id,
              :is_bcbs,
              :name,
              :payer_id,
              :created_at,
              :updated_at,
              :updated_by_id,
              :created_by_id,
              :carriers
            ],
            additionalProperties: false
          }.to_json
        end
        # rubocop:enable Metrics/MethodLength
      end
    end
  end
end
