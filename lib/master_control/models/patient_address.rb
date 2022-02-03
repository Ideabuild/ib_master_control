# frozen_string_literal: true
module MasterControl
  module Models
    class PatientAddress < MasterControl::Models::Base
      attributes \
        :id,
        :street1,
        :street2,
        :city,
        :city_id,
        :state,
        :state_id,
        :zipcode,
        :zipcode_id,
        :fips_code,
        :latitude,
        :longitude,
        :patient_id,
        :customer_id,
        :is_sync_update,
        :updated_by_id


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
              street1: { type: 'string' },
              street2: { type: ['string', 'null'] },
              city: { type: 'string' },
              city_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              state: { type: 'string' },
              state_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              zipcode: { type: 'string' },
              zipcode_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              fips_code: { type: ['string', 'null'] },
              latitude: { type: ['number', 'null'] },
              longitude: { type: ['number', 'null'] },
              patient_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              created_at: { type: 'string', format: 'date-time' },
              updated_at: { type: 'string', format: 'date-time' },
              updated_by_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] }
            },
            required: [
              :canonical_klass,
              :master_control_version,
              :is_sync_update,
              :version,
              :id,
              :active,
              :street1,
              :city,
              :state,
              :zipcode,
              :patient_id,
              :customer_id,
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
