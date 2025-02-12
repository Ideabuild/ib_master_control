# frozen_string_literal: true
module MasterControl
  module Models
    class Patient < MasterControl::Models::Base
      attributes  \
        :id,
        :aasm_state,
        :chart_number,
        :customer_id,
        :date_of_birth,
        :first_name,
        :email,
        :has_state_event,
        :full_name,
        :gender_id,
        :is_deceased,
        :middle_name,
        :last_discharged_at,
        :last_name,
        :phone,
        :ssn,
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
              aasm_state: { type: 'string' },
              chart_number: { type: ['string', 'null'] },
              customer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              date_of_birth: { type: 'string', format: 'date' },
              email: { type: ['string', 'null'] },
              full_name: { type: 'string' },
              gender_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              first_name: { type: 'string' },
              has_state_event: { type: 'boolean' },
              is_deceased: { type: 'boolean' },
              last_discharged_at: {  type: ['string', 'null'], format: 'date' },
              last_name: { type: 'string' },
              middle_name: { type: ['string', 'null'] },
              phone: { type: ['string', 'null'] },
              ssn: { type: ['string', 'null'] },
              state_event: { type: ['string', 'null'] },
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
              :first_name,
              :last_name,
              :full_name,
              :date_of_birth,
              :customer_id,
              :gender_id,
              :has_state_event,
              :updated_by_id,
              :created_by_id,
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
