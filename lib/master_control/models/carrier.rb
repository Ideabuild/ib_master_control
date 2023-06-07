# frozen_string_literal: true
module MasterControl
  module Models
    class Carrier < MasterControl::Models::Base
      attributes \
        :id,
        :name,
        :aasm_state,
        :carrier_type_name,
        :carrier_type_system_code,
        :carrier_family_name,
        :carrier_family_system_code,
        :is_consent_required,
        :version,
        :is_sync_update,
        :has_state_event,
        :state_event,
        :phone_number,
        :fax_number,
        :email,
        :url,
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
              aasm_state: { type: ['string', 'null'] },
              carrier_type_name: { type: 'string' },
              carrier_type_system_code: { type: 'string' },
              carrier_family_name: { type: 'string' },
              carrier_family_system_code: { type: 'string' },
              is_consent_required: { type: 'boolean' },
              has_state_event: { type: 'boolean' },
              state_event: { type: ['string', 'null'] },
              phone_number: { type: ['string', 'null'] },
              fax_number: { type: ['string', 'null'] },
              email: { type: ['string', 'null'] },
              url: { type: ['string', 'null'] },
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
              :carrier_type_name,
              :carrier_type_system_code,
              :carrier_family_name,
              :carrier_family_system_code,
              :is_consent_required,
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
