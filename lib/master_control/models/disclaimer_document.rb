# frozen_string_literal: true
module MasterControl
  module Models
    class DisclaimerDocument < MasterControl::Models::Base
      attributes \
        :id,
        :content_type,
        :disclaimer_id,
        :document_type_id,
        :original_filename,
        :s3_bucket,
        :s3_object_key,
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
              content_type: { type: 'string' },
              disclaimer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              document_type_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              original_filename: { type: 'string' },
              s3_bucket: { type: 'string' },
              s3_object_key: { type: 'string' },
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
              :active,
              :content_type,
              :disclaimer_id,
              :document_type_id,
              :original_filename,
              :s3_bucket,
              :s3_object_key,
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
