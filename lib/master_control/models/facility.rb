# frozen_string_literal: true
module MasterControl
  module Models
    class Facility < MasterControl::Models::Base
      attributes \
        :id,
        :name,
        :customer_id,
        :facility_type_id,
        :facility_type_name,
        :aasm_state,
        :last_modified,
        :updated_by_id


      class << self
        # rubocop:disable Metrics/MethodLength
        def json_schema
          {
            type: 'object',
            properties: {
              id: { type: 'string' },
              canonical_klass: { type: 'string' },
              version: { type: 'string' },
              active: { type: 'boolean' },
              name: { type: 'string' },
              customer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              facility_type_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              facility_type_name: { type: 'string' },
              aasm_state: { type: 'string' },
              created_at: { type: 'string', format: 'date-time' },
              updated_at: { type: 'string', format: 'date-time' },
              updated_by_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] }
            },
            required: [
              :canonical_klass,
              :version,
              :id,
              :active,
              :name,
              :customer_id,
              :facility_type_id,
              :facility_type_name,
              :aasm_state,
              :created_at,
              :updated_at,
              :updated_by_id
            ],
            additionalProperties: false
          }.to_json
        end
        # rubocop:enable Metrics/MethodLength
      end
    end
  end
end
