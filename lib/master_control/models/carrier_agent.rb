# frozen_string_literal: true
module MasterControl
  module Models
    class CarrierAgent < MasterControl::Models::Base
      attributes \
        :id,
        :carrier_id,
        :first_name,
        :middle_name,
        :last_name,
        :email,
        :phone,
        :fax,
        :url,
        :s3_object_key,
        :document_name,
        :document_type_id,
        :carrier_agent_type_id,
        :notes,
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
              carrier_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              carrier_agent_type_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              document_type_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              first_name: { type: 'string' },
              middle_name: { type: ['string', 'null'] },
              last_name: { type: 'string' },
              email: { type: ['string', 'null'] },
              phone: { type: ['string', 'null'] },
              fax: { type: ['string', 'null'] },
              url: { type: ['string', 'null'] },
              s3_object_key: { type: ['string', 'null'] },
              document_name: { type: ['string', 'null'] },
              notes: { type: ['string', 'null'] },
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
              :active,
              :carrier_id,
              :first_name,
              :last_name,
              :carrier_agent_type_id,
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
