# frozen_string_literal: true
module MasterControl
  module Models
    class CustomerAppNotification < MasterControl::Models::Base
      attributes \
        :id,
        :customer_id,
        :app_notification_id,
        :name,
        :system_code,
        :app_icon_id,
        :app_url_id,
        :subject,
        :contents,
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
              customer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              app_notification_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              name: { type: 'string' },
              system_code: { type: 'string' },
              app_icon_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              app_url_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              subject: { type: 'string' },
              contents: { type: 'string' },
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
              :customer_id,
              :app_notification_id,
              :name,
              :system_code,
              :app_icon_id,
              :app_url_id,
              :subject,
              :contents,
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
