# frozen_string_literal: true
module MasterControl
  module Models
    class PendingCarrier < MasterControl::Models::Base
      attributes \
        :id,
        :aasm_state,
        :blue_ink_required,
        :carrier_identifier,
        :eligibility_source_id,
        :enrollment_required,
        :enrollment_mandatory_fields,
        :enrollment_signature_required,
        :is_resolved,
        :message,
        :name,
        :pass_through_fee,
        :secondary_supported,
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
              aasm_state: { type: 'string' },
              blue_ink_required: { type: ['null', 'boolean'] },
              carrier_identifier: { type: 'string' },
              eligibility_source_id: { type: ['null', 'string'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              enrollment_required: { type: ['null', 'boolean'] },
              enrollment_mandatory_fields: { type: ['null', 'string'] },
              enrollment_signature_required: { type: ['null', 'boolean'] },
              is_resolved: { type: 'boolean' },
              message: { type: ['null', 'string'] },
              name: { type: 'string' },
              pass_through_fee: { type: ['null', 'float'] },
              secondary_supported: { type: ['null', 'boolean'] },
              is_sync_update: { type: 'boolean' },
              version: { type: 'integer' },
              active: { type: 'boolean' },
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
              :aasm_state,
              :name,
              :carrier_identifier,
              :is_resolved,
              :active,
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
