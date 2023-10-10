# frozen_string_literal: true
module MasterControl
  module Models
    class ThirdPartyAdminDivision < MasterControl::Models::Base
      attributes \
        :id,
        :aasm_state,
        :city_name,
        :city_id,
        :customer_id,
        :customer_app_state_id,
        :email,
        :fax,
        :fips_code,
        :latitude,
        :longitude,
        :name,
        :payer_id,
        :phone,
        :phone_extension,
        :search_terms,
        :state_name,
        :state_id,
        :street_1,
        :street_2,
        :system_code,
        :third_party_admin_id,
        :url,
        :zipcode_value,
        :zipcode_id,
        :version,
        :is_sync_update,
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
              is_sync_update: { type: 'boolean' },
              version: { type: 'integer' },
              active: { type: 'boolean' },
              aasm_state: { type: 'string' },
              city_name: { type: ['string', 'null'] },
              city_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_app_state_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              email: { type: ['string', 'null'] },
              fax: { type: ['string', 'null'] },
              fips_code: { type: ['string', 'null'] },
              latitude: { type: ['number', 'null'] },
              longitude: { type: ['number', 'null'] },
              name: { type: 'string' },
              payer_id: { type: ['string', 'null'] },
              phone: { type: ['string', 'null'] },
              phone_extension: { type: ['string', 'null'] },
              search_terms: { type: 'string' },
              state_name: { type: ['string', 'null'] },
              state_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              street_1: { type: ['string', 'null'] },
              street_2: { type: ['string', 'null'] },
              system_code: { type: 'string' },
              third_party_admin_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              url: { type: ['string', 'null'] },
              zipcode_value: { type: ['string', 'null'] },
              zipcode_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
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
