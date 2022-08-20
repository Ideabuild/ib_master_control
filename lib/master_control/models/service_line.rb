# frozen_string_literal: true
module MasterControl
  module Models
    class ServiceLine < MasterControl::Models::Base
      attributes \
        :id,
        :authorization_review_type_id,
        :auth_follow_up_day_threshold,
        :clinical_assessment_type_id,
        :name,
        :order,
        :system_code,
        :version,
        :created_at,
        :updated_at,
        :updated_by_id,
        :created_by_id,
        :active

        attribute :services

      class << self
        # rubocop:disable Metrics/MethodLength
        def json_schema
          {
            type: 'object',
            properties: {
              id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              canonical_klass: { type: 'string' },
              master_control_version: { type: 'string' },
              version: { type: 'integer' },
              order: { type: 'integer' },
              active: { type: 'boolean' },
              name: { type: 'string' },
              system_code: { type: 'string' },
              authorization_review_type_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              auth_follow_up_day_threshold: { type: 'integer' },
              clinical_assessment_type_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              created_at: { type: 'string', format: 'date-time' },
              updated_at: { type: 'string', format: 'date-time' },
              updated_by_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              created_by_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              services: {
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
              :id,
              :active,
              :authorization_review_type_id,
              :auth_follow_up_day_threshold,
              :clinical_assessment_type_id,
              :name,
              :order,
              :services,
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
