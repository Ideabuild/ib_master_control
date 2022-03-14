# frozen_string_literal: true
module MasterControl
  module Models
    class ThirdPartyAdmin < MasterControl::Models::Base
      attributes \
        :id,
        :name,
        :email,
        :fax,
        :phone,
        :system_code,
        :third_party_admin_type_id,
        :third_party_admin_type_name,
        :third_party_admin_type_system_code,
        :url,
        :version,
        :is_sync_update,
        :created_at,
        :updated_at,
        :updated_by_id,
        :created_by_id,
        :active

        attribute :carriers


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
              email: { type: ['string', 'null'] },
              fax: { type: ['string', 'null'] },
              name: { type: 'string' },
              phone: { type: ['string', 'null'] },
              system_code: { type: 'string' },
              third_party_admin_type_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              third_party_admin_type_name: { type: 'string' },
              third_party_admin_type_system_code: { type: 'string' },
              url: { type: ['string', 'null'] },
              carriers: {
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
              updated_by_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              created_by_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] }
            },
            required: [
              :canonical_klass,
              :master_control_version,
              :is_sync_update,
              :version,
              :id,
              :active,
              :name,
              :system_code,
              :third_party_admin_type_id,
              :third_party_admin_type_name,
              :third_party_admin_type_system_code,
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
