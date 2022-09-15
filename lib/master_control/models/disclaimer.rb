# frozen_string_literal: true
module MasterControl
  module Models
    class Disclaimer < MasterControl::Models::Base
      attributes \
        :id,
        :content,
        :content_type,
        :disclaimer_category_id,
        :disclaimer_category_name,
        :disclaimer_category_system_code,
        :disclaimer_type_id,
        :disclaimer_type_name,
        :disclaimer_type_system_code,
        :document_name,
        :name,
        :order,
        :original_filename,
        :s3_object_key,
        :s3_bucket,
        :summary,
        :system_code,
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
              content: { type: 'string' },
              content_type: { type: ['string', 'null'] },
              disclaimer_category_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              disclaimer_category_name: { type: 'string' },
              disclaimer_category_system_code: { type: 'string' },
              disclaimer_type_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              document_name: { type: ['string', 'null'] },
              name: { type: 'string' },
              order: { type: 'integer' },
              original_filename: { type: ['string', 'null'] },
              s3_object_key: { type: ['string', 'null'] },
              s3_bucket: { type: ['string', 'null'] },
              summary: { type: 'string' },
              system_code: { type: 'string' },
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
              :content,
              :disclaimer_category_id,
              :disclaimer_category_name,
              :disclaimer_category_system_code,
              :disclaimer_type_id,
              :name,
              :order,
              :summary,
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
