# frozen_string_literal: true
module MasterControl
  module Models
    class CustomerProvider < MasterControl::Models::Base
      attributes \
        :id,
        :name,
        :first_name,
        :middle_name,
        :last_name,
        :npi,
        :employer_identification_number,
        :credentials,
        :prefix,
        :suffix,
        :other_name,
        :other_first_name,
        :other_middle_name,
        :other_last_name,
        :gender_id,
        :provider_type,
        :customer_id,
        :provider_id,
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
              name: { type: ['string'] },
              first_name: { type: 'string' },
              middle_name: { type: ['string', 'null'] },
              last_name: { type: 'string' },
              npi: { type: 'string' },
              employer_identification_number: { type: ['string', 'null'] },
              credentials: { type: ['string', 'null'] },
              prefix: { type: ['string', 'null'] },
              suffix: { type: ['string', 'null'] },
              other_name: { type: ['string', 'null'] },
              other_first_name: { type: ['string', 'null'] },
              other_middle_name: { type: ['string', 'null'] },
              other_last_name: { type: ['string', 'null'] },
              provider_type: { type: 'string' },
              customer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              provider_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              gender_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              created_at: { type: 'string', format: 'date-time' },
              updated_at: { type: 'string', format: 'date-time' },
              active: { type: 'boolean' }
            },
            required: [
              :canonical_klass,
              :master_control_version,
              :version,
              :id,
              :name,
              :first_name,
              :last_name,
              :npi,
              :customer_id,
              :provider_id,
              :provider_type,
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
