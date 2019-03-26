# frozen_string_literal: true
module MasterControl
  module Models
    class CarrierEligibility < MasterControl::Models::Base
      attributes \
        :id,
        :eligibility_source_id,
        :carrier_id,
        :carrier_identifier,
        :pass_through_fee,
        :enrollment_required,
        :enrollment_mandatory_fields,
        :enrollment_signature_required,
        :secondary_supported,
        :blue_ink_required,
        :message,
        :version,
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
              eligibility_source_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              carrier_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              carrier_identifier: { type: 'string' },
              pass_through_fee: { type: 'number' },
              enrollment_required: { type: 'boolean' },
              enrollment_mandatory_fields: { type: 'string' },
              enrollment_signature_required: { type: 'boolean' },
              secondary_supported: { type: 'boolean' },
              blue_ink_required: { type: 'boolean' },
              message: { type: 'string' },
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
              :eligibility_source_id,
              :carrier_id,
              :carrier_identifier,
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
