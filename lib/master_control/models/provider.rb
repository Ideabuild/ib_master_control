# frozen_string_literal: true
module MasterControl
  module Models
    class Provider < MasterControl::Models::Base
      attributes \
        :id,
        :title,
        :first_name,
        :last_name,
        :npi,
        :customer_id,
        :active

      class << self
        # rubocop:disable Metrics/MethodLength
        def json_schema
          {
            type: 'object',
            properties: {
              canonical_klass: { type: 'string' },
              master_control_version: { type: 'string' },
              version: { type: 'integer' },
              id: { type: 'string' },
              title: { type: ['string', 'null'] },
              first_name: { type: 'string' },
              last_name: { type: 'string' },
              npi: { type: 'string' },
              customer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              created_at: { type: 'string', format: 'date-time' },
              updated_at: { type: 'string', format: 'date-time' }
            },
            required: [
              :canonical_klass,
              :master_control_version,
              :version,
              :id,
              :first_name,
              :last_name,
              :npi,
              :customer_id,
              :created_at,
              :updated_at
            ],
            additionalProperties: false
          }.to_json
        end
        # rubocop:enable Metrics/MethodLength
      end
    end
  end
end
