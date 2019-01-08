# frozen_string_literal: true
module MasterControl
  module Models
    class Zipcode < MasterControl::Models::Base
      attributes \
        :id,
        :zipcode,
        :zipcode_type,
        :city_id,
        :county_id,
        :state_id,
        :timezone,
        :utc_offset,
        :latitude,
        :longitude,
        :is_daylight_savings,
        :msa_code,
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
              zipcode: { type: 'string' },
              zipcode_type: { type: 'string' },
              city_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              county_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              state_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              timezone: { type: 'string' },
              utc_offset: { type: 'integer' },
              latitude: { type: 'number' },
              longitude: { type: 'number' },
              is_daylight_savings: { type: 'boolean' },
              msa_code: { type: 'string' },
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
              :zipcode,
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
