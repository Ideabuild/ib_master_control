# frozen_string_literal: true
module MasterControl
  module Models
    class Guarantor < MasterControl::Models::Base
      attributes \
        :id,
        :customer_id,
        :customer_key,
        :first_name,
        :last_name,
        :middle_initial,
        :address_1,
        :address_2,
        :city,
        :state,
        :zip,
        :zip_plus_four,
        :version,
        :phone,
        :active

      class << self
        # rubocop:disable Metrics/MethodLength
        def json_schema
          {
            type: 'object',
            properties: {
              id: { type: 'string' },
              canonical_klass: { type: 'string' },
              master_control_version: { type: 'string' },
              version: { type: 'integer' },
              customer_id: { type: ['string', 'null'] },
              customer_key: { type: 'string' },
              first_name: { type: ['string', 'null'] },
              last_name: { type: ['string', 'null'] },
              middle_initial: { type: ['string', 'null'] },
              address_1: { type: ['string', 'null'] },
              address_2: { type: ['string', 'null'] },
              city: { type: ['string', 'null'] },
              state: { type: ['string', 'null'] },
              zip: { type: ['string', 'null'] },
              zip_plus_four: { type: ['string', 'null'] },
              phone: { type: ['string', 'null'] },
              last_modified: { type: ['date-time', 'null'] },
              created_at: { type: 'string', format: 'date-time' },
              updated_at: { type: 'string', format: 'date-time' }
            },
            required: [
              :canonical_klass,
              :master_control_version,
              :version,
              :id,
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
