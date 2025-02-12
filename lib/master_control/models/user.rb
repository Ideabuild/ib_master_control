# frozen_string_literal: true
module MasterControl
  module Models
    class User < MasterControl::Models::Base
      attributes \
        :id,
        :active,
        :aasm_state,
        :customer_id,
        :customer_app_state_id,
        :email,
        :first_name,
        :has_state_event,
        :is_mfa_required,
        :is_out_of_office,
        :last_name,
        :name,
        :out_of_office_delegate_id,
        :timezone_id,
        :state_event,
        :version,
        :customers,
        :is_sync_update,
        :created_at,
        :updated_at,
        :updated_by_id,
        :created_by_id

      attribute :roles
      attribute :ib_applications

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
              aasm_state: { type: 'string' },
              customer_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_app_state_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              email: { type: 'string' },
              first_name: { type: 'string' },
              is_mfa_required: { type: 'boolean' },
              is_out_of_office: { type: 'boolean' },
              last_name: { type: 'string' },
              name: { type: 'string' },
              out_of_office_delegate_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              timezone_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              has_state_event: { type: 'boolean' },
              state_event: { type: ['string', 'null'] },
              roles: {
                type: 'array',
                items: {
                  type: 'object',
                  properties: {
                    id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
                    name: { type: 'string' }
                  }
                }
              },
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
              customers: {
                type: 'array',
                items: {
                  type: 'object',
                  properties: {
                    id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
                    name: { type: 'string' }
                  }
                }
              },
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
              :id,
              :active,
              :email,
              :first_name,
              :last_name,
              :name,
              :aasm_state,
              :customer_id,
              :has_state_event,
              :is_mfa_required,
              :roles,
              :ib_applications,
              :customers,
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
