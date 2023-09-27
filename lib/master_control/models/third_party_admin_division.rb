# frozen_string_literal: true
module MasterControl
  module Models
    class ThirdPartyAdminDivision < MasterControl::Models::Base
      attributes \
        :id,
        :aasm_state,
        :customer_id,
        :customer_app_state_id,
        :email,
        :fax,
        :name,
        :phone,
        :search_terms,
        :system_code,
        :third_party_admin_id,
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
              aasm_state: { type: 'string' },
              customer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_app_state_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              email: { type: ['string', 'null'] },
              fax: { type: ['string', 'null'] },
              name: { type: 'string' },
              phone: { type: ['string', 'null'] },
              search_terms: { type: 'string' },
              system_code: { type: 'string' },
              third_party_admin_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              url: { type: ['string', 'null'] },
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
              :aasm_state,
              :customer_id,
              :customer_app_state_id,
              :name,
              :search_terms,
              :system_code,
              :third_party_admin_id,
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
