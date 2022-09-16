# frozen_string_literal: true
module MasterControl
  module Models
    class DisclaimerType < MasterControl::Models::Base
      attributes \
        :id,
        :name,
        :order,
        :system_code,
        :disclaimer_category_id,
        :disclaimer_category_name,
        :disclaimer_category_system_code,
        :version,
        :is_sync_update,
        :created_at,
        :updated_at,
        :updated_by_id,
        :created_by_id,
        :active

        attribute :document_rejection_reasons

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
              name: { type: 'string' },
              order: { type: 'integer' },
              system_code: { type: 'string' },
              disclaimer_category_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              disclaimer_category_name: { type: 'string' },
              disclaimer_category_system_code: { type: 'string' },
              created_at: { type: 'string', format: 'date-time' },
              updated_at: { type: 'string', format: 'date-time' },
              updated_by_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              created_by_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
            },
            required: [
              :canonical_klass,
              :master_control_version,
              :is_sync_update,
              :version,
              :id,
              :active,
              :name,
              :order,
              :system_code,
              :disclaimer_category_id,
              :disclaimer_category_name,
              :disclaimer_category_system_code,
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