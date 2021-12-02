# frozen_string_literal: true
module MasterControl
  module Models
    class CustomerServiceLine < MasterControl::Models::Base
      attributes \
        :id,
        :customer_id,
        :service_line_id,
        :name,
        :system_code,
        :is_on_verification_form,
        :clinical_assessment_type_id,
        :version,
        :is_sync_update,
        :created_at,
        :updated_at,
        :updated_by_id,
        :created_by_id,
        :active

      attribute :customer_services

      class << self
        # rubocop:disable Metrics/MethodLength
        def json_schema
          {
            type: 'object',
            properties: {
              id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              service_line_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              canonical_klass: { type: 'string' },
              master_control_version: { type: 'string' },
              is_sync_update: { type: 'boolean' },
              version: { type: 'integer' },
              active: { type: 'boolean' },
              name: { type: 'string' },
              system_code: { type: 'string' },
              is_on_verification_form: { type: 'boolean' },
              clinical_assessment_type_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              created_at: { type: 'string', format: 'date-time' },
              updated_at: { type: 'string', format: 'date-time' },
              updated_by_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              created_by_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_services: {
                type: 'array',
                items: {
                  type: 'object',
                  properties: {
                    id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
                    name: { type: 'string' },
                    system_code: { type: 'string' }
                  }
                }
              }
            },
            required: [
              :canonical_klass,
              :master_control_version,
              :version,
              :is_sync_update,
              :id,
              :customer_id,
              :service_line_id,
              :active,
              :name,
              :system_code,
              :is_on_verification_form,
              :customer_services,
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
