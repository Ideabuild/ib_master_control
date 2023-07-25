# frozen_string_literal: true
module MasterControl
  module Models
    class CustomerServiceLine < MasterControl::Models::Base
      attributes \
        :id,
        :authorization_review_type_id,
        :auth_follow_up_day_threshold,
        :clinical_assessment_type_id,
        :customer_id,
        :is_on_verification_form,
        :name,
        :order,
        :requires_accreditation,
        :system_code,
        :service_line_id,
        :version,
        :is_sync_update,
        :created_at,
        :updated_at,
        :updated_by_id,
        :created_by_id,
        :active

      attribute :customer_services
      attribute :required_documents
      attribute :optional_documents

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
              authorization_review_type_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              auth_follow_up_day_threshold: { type: 'integer' },
              customer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              clinical_assessment_type_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              is_on_verification_form: { type: 'boolean' },
              name: { type: 'string' },
              order: { type: 'integer' },
              requires_accreditation: { type: 'boolean' },
              service_line_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              system_code: { type: 'string' },
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
              },
              required_documents: {
                type: 'array',
                items: {
                  type: 'object',
                  properties: {
                    id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] }
                  }
                }
              },
              optional_documents: {
                type: 'array',
                items: {
                  type: 'object',
                  properties: {
                    id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] }
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
              :authorization_review_type_id,
              :auth_follow_up_day_threshold,
              :customer_id,
              :is_on_verification_form,
              :name,
              :order,
              :requires_accreditation,
              :service_line_id,
              :system_code,
              :created_at,
              :updated_at,
              :updated_by_id,
              :created_by_id,
              :active
            ],
            additionalProperties: false
          }.to_json
        end
        # rubocop:enable Metrics/MethodLength
      end
    end
  end
end
