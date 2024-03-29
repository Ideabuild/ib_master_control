# frozen_string_literal: true
module MasterControl
  module Models
    class ThirdPartyAdminAddress < MasterControl::Models::Base
      attributes \
        :id,
        :third_party_admin_id,
        :third_party_admin_division_id,
        :address_type_id,
        :is_primary,
        :street_1,
        :street_2,
        :city_name,
        :city_id,
        :state_name,
        :state_id,
        :zipcode_value,
        :zipcode_id,
        :fips_code,
        :latitude,
        :longitude,
        :is_sync_update,
        :version,
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
              master_control_version: { type: 'string' },
              is_sync_update: { type: 'boolean' },
              version: { type: 'integer' },
              active: { type: 'boolean' },
              third_party_admin_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              third_party_admin_division_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              address_type_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              is_primary: { type: 'boolean' },
              street_1: { type: 'string' },
              street_2: { type: ['string', 'null'] },
              city_name: { type: 'string' },
              city_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              state_name: { type: 'string' },
              state_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              zipcode_value: { type: 'string' },
              zipcode_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              fips_code: { type: ['string', 'null'] },
              latitude: { type: ['number', 'null'] },
              longitude: { type: ['number', 'null'] },
              created_at: { type: 'string', format: 'date-time' },
              updated_at: { type: 'string', format: 'date-time' },
              updated_by_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] }
            },
            required: [
              :canonical_klass,
              :master_control_version,
              :is_sync_update,
              :version,
              :active,
              :id,
              :third_party_admin_id,
              :third_party_admin_division_id,
              :address_type_id,
              :is_primary,
              :street_1,
              :city_name,
              :state_name,
              :zipcode_value,
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
