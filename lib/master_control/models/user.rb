# frozen_string_literal: true
module MasterControl
  module Models
    class User < MasterControl::Models::Base
      attributes \
        :id,
        :active,
        :email,
        :first_name,
        :last_name,
        :aasm_state,
        :customer_id,
        :updated_by_id

      attribute :roles

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
              email: { type: 'string' },
              first_name: { type: 'string' },
              last_name: { type: 'string' },
              aasm_state: { type: 'string' },
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
              ib_applications: {
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
              updated_at: { type: 'string', format: 'date-time' },
              updated_by_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] }
            },
            required: [
              :canonical_klass,
              :version,
              :id,
              :active,
              :email,
              :first_name,
              :last_name,
              :aasm_state,
              :customer_id,
              :roles,
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
