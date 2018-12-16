# frozen_string_literal: true
module MasterControl
  module Models
    class Role < MasterControl::Models::Base
      attributes \
        :id,
        :name,
        :display_name,
        :resource_id,
        :resource_type,
        :is_client_selectable,
        :last_modified


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
              name: { type: 'string' },
              display_name: { type: 'string' },
              resource_type: { type: ['string', 'null'] },
              resource_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              is_client_selectable: { type: 'boolean' },
              created_at: { type: 'string', format: 'date-time' },
              updated_at: { type: 'string', format: 'date-time' }
            },
            required: [
              :canonical_klass,
              :version,
              :id,
              :is_active,
              :name,
              :display_name,
              :resource_type,
              :resource_id,
              :is_client_selectable,
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
