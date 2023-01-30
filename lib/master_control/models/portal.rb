# frozen_string_literal: true
module MasterControl
  module Models
    class Portal < MasterControl::Models::Base
      attributes \
        :id,
        :admin_email,
        :admin_name,
        :name,
        :password,
        :portal_type_name,
        :portal_type_system_code,
        :url,
        :username,
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
              id: { type: 'string' },
              canonical_klass: { type: 'string' },
              master_control_version: { type: 'string' },
              is_sync_update: { type: 'boolean' },
              version: { type: 'integer' },
              active: { type: 'boolean' },
              admin_email: { type: 'string' },
              admin_name: { type: 'string' },
              customer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              name: { type: 'string' },
              portal_type_name: { type: 'string' },
              portal_type_system_code: { type: 'string' },
              password: { type: 'string' },
              url: { type: 'string' },
              username: { type: 'string' },
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
              :admin_email,
              :admin_name,
              :customer_id,
              :name,
              :portal_type_name,
              :portal_type_system_code,
              :password,
              :url,
              :username,
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
