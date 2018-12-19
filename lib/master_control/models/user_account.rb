# frozen_string_literal: true
module MasterControl
  module Models
    class User < MasterControl::Models::Base
      attributes \
        :id,
        :is_active,
        :email,
        :first_name,
        :last_name,
        :customer_id

      attribute :roles

      class << self
        # rubocop:disable Metrics/MethodLength
        def json_schema
          {
            type: 'object',
            properties: {
              id: { type: 'string' },
              canonical_klass: { type: 'string' },
              version: { type: 'string' },
              is_active: { type: 'boolean' },
              email: { type: 'string' },
              first_name: { type: 'string' },
              last_name: { type: 'string' },
              customer_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              roles: {
                type: 'array',
                items: {
                  type: 'object',
                  properties: {
                    id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
                    name: { type: 'string' }
                  }
                }
              },
              created_at: { type: 'string', format: 'date-time' },
              updated_at: { type: 'string', format: 'date-time' }
            },
            required: [
              :canonical_klass,
              :version,
              :id,
              :is_active,
              :email,
              :first_name,
              :last_name,
              :customer_id,
              :roles,
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
