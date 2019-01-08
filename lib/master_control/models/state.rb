# frozen_string_literal: true
module MasterControl
  module Models
    class State < MasterControl::Models::Base
      attributes \
        :id,
        :name,
        :abbreviation,
        :fips_code,
        :updated_by_id,
        :created_by_id


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
              abbreviation: { type: 'string' },
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
              :abbreviation,
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
