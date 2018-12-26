# frozen_string_literal: true
module MasterControl
  module Models
    class CustomerType < MasterControl::Models::Base
      attributes \
        :id,
        :name,
        :system_code,
        :last_modified,
        :updated_by_id,
        :active


      class << self
        # rubocop:disable Metrics/MethodLength
        def json_schema
          {
            type: 'object',
            properties: {
              id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              canonical_klass: { type: 'string' },
              version: { type: 'string' },
              active: { type: 'boolean' },
              name: { type: 'string' },
              system_code: { type: 'string' },
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
              :system_code,
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
