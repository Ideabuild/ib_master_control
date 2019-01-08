# frozen_string_literal: true
module MasterControl
  module Models
    class Customer < MasterControl::Models::Base

      attributes \
        :id,
        :name,
        :npi,
        :owner_id,
        :management_customer_id,
        :active,
        :version,
        :created_at,
        :updated_at,
        :customer_type_id,
        :customer_type_name,
        :updated_by_id,
        :created_by_id

      class << self
        # rubocop:disable Metrics/MethodLength
        def json_schema
          {
            type: 'object',
            properties: {
              canonical_klass: { type: 'string' },
              master_control_version: { type: 'string' },
              version: { type: 'integer' },
              id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              name: { type: 'string' },
              npi: { type: 'string' },
              owner_id: { type: ['string'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              management_customer_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_type_id: { type: ['string'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_type_name: { type: ['string'] },
              active: { type: 'boolean' },
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
              :name,
              :npi,
              :active,
              :owner_id,
              :management_customer_id,
              :created_at,
              :updated_at,
              :customer_type_id,
              :customer_type_name,
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
