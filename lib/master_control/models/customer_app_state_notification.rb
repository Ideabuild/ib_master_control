# frozen_string_literal: true
module MasterControl
  module Models
    class CustomerAppStateNotification < MasterControl::Models::Base
      attributes \
        :id,
        :app_model_id,
        :app_state_notification_id,
        :content_type,
        :customer_app_notification_id,
        :customer_app_state_id,
        :customer_id,
        :document_type_id,
        :has_model_attachment,
        :has_attachment,
        :name,
        :original_filename,
        :system_code,
        :s3_bucket,
        :s3_object_key,
        :version,
        :is_sync_update,
        :created_at,
        :updated_at,
        :updated_by_id,
        :created_by_id,
        :active

        attribute :roles

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
              app_model_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              app_state_notification_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              content_type: { type: ['string', 'null'] },
              customer_app_notification_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_app_state_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              document_type_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              has_model_attachment: { type: 'boolean' },
              has_attachment: { type: 'boolean' },
              name: { type: 'string' },
              original_filename: { type: ['string', 'null'] },
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
              system_code: { type: 'string' },
              s3_bucket: { type: ['string', 'null'] },
              s3_object_key: { type: ['string', 'null'] },
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
              :app_model_id,
              :app_state_notification_id,
              :customer_app_notification_id,
              :customer_app_state_id,
              :customer_id,
              :has_model_attachment,
              :has_attachment,
              :name,
              :roles,
              :system_code,
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
