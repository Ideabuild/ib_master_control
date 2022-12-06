# frozen_string_literal: true
module MasterControl
  module Models
    class Customer < MasterControl::Models::Base

      attributes \
        :id,
        :active,
        :version,
        :is_sync_update,
        :aasm_state,
        :amd_login_url,
        :amd_username,
        :amd_password_encrypted,
        :amd_password_encrypted_iv,
        :amd_office_key,
        :amd_app_name,
        :customer_provider_id,
        :customer_type_name,
        :customer_type_system_code,
        :dwh_id,
        :has_state_event,
        :management_customer_id,
        :name,
        :npi,
        :owner_id,
        :state_event,
        :use_management_customer_work_queues,
        :created_at,
        :updated_at,
        :updated_by_id,
        :created_by_id,
        :ib_applications

      class << self
        # rubocop:disable Metrics/MethodLength
        def json_schema
          {
            type: 'object',
            properties: {
              canonical_klass: { type: 'string' },
              master_control_version: { type: 'string' },
              is_sync_update: { type: 'boolean' },
              version: { type: 'integer' },
              id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              aasm_state: { type: 'string' },
              amd_login_url: { type: ['string', 'null'] },
              amd_username: { type:  ['string', 'null'] },
              amd_password_encrypted: { type: ['string', 'null'] },
              amd_password_encrypted_iv: { type: ['string', 'null'] },
              amd_office_key: { type: ['string', 'null'] },
              amd_app_name: { type: ['string', 'null'] },
              customer_provider_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_type_name: { type: ['string'] },
              customer_type_system_code: { type: ['string'] },
              dwh_id: { type: ['integer', 'null'] },
              has_state_event: { type: 'boolean' },
              management_customer_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              name: { type: 'string' },
              npi: { type: 'string' },
              owner_id: { type: ['string'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              state_event: { type: ['string', 'null'] },
              use_management_customer_work_queues: { type: 'boolean' },
              active: { type: 'boolean' },
              created_at: { type: 'string', format: 'date-time' },
              updated_at: { type: 'string', format: 'date-time' },
              ib_applications: {
                type: 'array',
                items: {
                  type: 'object',
                  properties: {
                    id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
                    name: { type: 'string' }
                  }
                }
              },
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
              :customer_type_name,
              :customer_type_system_code,
              :has_state_event,
              :management_customer_id,
              :name,
              :npi,
              :owner_id,
              :use_management_customer_work_queues,
              :created_at,
              :updated_at,
              :updated_by_id,
              :created_by_id,
              :ib_applications
            ],
            additionalProperties: false
          }.to_json
        end
        # rubocop:enable Metrics/MethodLength
      end
    end
  end
end
