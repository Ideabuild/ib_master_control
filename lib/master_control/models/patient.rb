# frozen_string_literal: true
module MasterControl
  module Models
    class Patient < MasterControl::Models::Base
      attributes  \
        :id,
        :address_1,
        :address_2,
        :city,
        :customer_id,
        :customer_key,
        :date_of_birth,
        :email_address,
        :first_name,
        :middle_initial,
        :last_name,
        :gender,
        :is_deceased,
        :last_modified,
        :marital_status,
        :chart_number,
        :phone_number,
        :ssn,
        :state,
        :zip,
        :zip_plus_four,
        :created_at,
        :updated_at

      class << self
        # rubocop:disable Metrics/MethodLength
        def json_schema
          {
            type: 'object',
            properties: {
              canonical_klass: { type: 'string' },
              version: { type: 'string' },
              id: { type: 'string' },
              address_1: { type: ['string', 'null'] },
              address_2: { type: ['string', 'null'] },
              city: { type: ['string', 'null'] },
              customer_id: { type: ['string', 'null'] },
              customer_key: { type: 'string' },
              date_of_birth: { type: ['string', 'null'], format: 'date' },
              deceased_date: { type: ['string', 'null'], format: 'date' },
              email_address: { type: ['string', 'null'] },
              first_name: { type: ['string', 'null'] },
              middle_initial: { type: ['string', 'null'] },
              last_name: { type: ['string', 'null'] },
              gender: { type: ['integer', 'null'] },
              is_deceased: { type: ['fixnum', 'null'] },
              last_modified: { type: ['date-time', 'null'] },
              marital_status: { type: ['fixnum', 'null'] },
              chart_number: { type: ['string', 'null'] },
              phone_number: { type: ['string', 'null'] },
              ssn: { type: ['string', 'null'] },
              state: { type: ['string', 'null'] },
              zip: { type: ['string', 'null'] },
              zip_plus_four: { type: ['string', 'null'] },
              created_at: { type: 'string', format: 'date-time' },
              updated_at: { type: 'string', format: 'date-time' }
            },
            required: [
              :canonical_klass,
              :version,
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
