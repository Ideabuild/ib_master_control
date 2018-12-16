# frozen_string_literal: true
module MasterControl
  module Models
    class Customer < MasterControl::Models::Base

      attributes \
        :id,
        :name,
        :npi,
        :address_1,
        :address_2,
        :city,
        :state,
        :postal_code,
        :is_active,
        :created_at,
        :updated_at,
        :customer_type_id,
        :customer_type_name

      class << self
        # rubocop:disable Metrics/MethodLength
        def json_schema
          {
            type: 'object',
            properties: {
              canonical_klass: { type: 'string' },
              version: { type: 'string' },
              id: { type: 'string' },
              name: { type: 'string' },
              npi: { type: 'string' },
              address_1: { type: ['string', 'null'] },
              address_2: { type: ['string', 'null'] },
              city: { type: ['string', 'null'] },
              state: { type: ['string', 'null'] },
              postal_code: { type: ['string', 'null'] },
              is_active: { type: 'boolean' },
              created_at: { type: 'string', format: 'date-time' },
              updated_at: { type: 'string', format: 'date-time' },
              customer_type_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_type_name: { type: 'string' }
            },
            required: [
              :canonical_klass,
              :version,
              :id,
              :name,
              :npi,
              :is_active,
              :created_at,
              :updated_at,
              :customer_type_id,
              :customer_type_name
            ],
            additionalProperties: false
          }.to_json
        end
        # rubocop:enable Metrics/MethodLength
      end
    end
  end
end
