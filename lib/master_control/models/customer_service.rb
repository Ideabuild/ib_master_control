# frozen_string_literal: true
module MasterControl
  module Models
    class CustomerService < MasterControl::Models::Base
      attributes \
        :id,
        :customer_id,
        :service_id,
        :name,
        :system_code,
        :is_on_verification_form,
        :require_duration,
        :require_provider,
        :require_dx_codes,
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
              customer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              service_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              canonical_klass: { type: 'string' },
              master_control_version: { type: 'string' },
              is_sync_update: { type: 'boolean' },
              version: { type: 'integer' },
              active: { type: 'boolean' },
              name: { type: 'string' },
              system_code: { type: 'string' },
              created_at: { type: 'string', format: 'date-time' },
              is_on_verification_form: { type: 'boolean' },
              require_duration: { type: 'boolean' },
              require_provider: { type: 'boolean' },
              require_dx_codes: { type: 'boolean' },
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
              :customer_id,
              :service_id,
              :active,
              :name,
              :system_code,
              :is_on_verification_form,
              :require_duration,
              :require_provider,
              :require_dx_codes,
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
