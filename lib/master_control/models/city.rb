# frozen_string_literal: true
module MasterControl
  module Models
    class City < MasterControl::Models::Base
      attributes \
        :id,
        :name,
        :fips_code,
        :ansi_code,
        :county_fips_code,
        :state_fips_code,
        :external_source_reference,
        :latitude,
        :longitude,
        :population,
        :state_id,
        :county_id,
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
              version: { type: 'integer' },
              active: { type: 'boolean' },
              name: { type: 'string' },
              fips_code: { type: 'string' },
              ansi_code: { type: 'string' },
              county_fips_code: { type: 'string' },
              state_fips_code: { type: 'string' },
              external_source_reference: { type: 'string' },
              latitude: { type: 'number' },
              longitude: { type: 'number' },
              population: { type: 'integer' },
              state_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              county_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              created_at: { type: 'string', format: 'date-time' },
              updated_at: { type: 'string', format: 'date-time' },
              updated_by_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              created_by_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] }
            },
            required: [
              :canonical_klass,
              :master_control_version,
              :version,
              :id,
              :active,
              :name,
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
