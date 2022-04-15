# frozen_string_literal: true
module MasterControl
  module Models
    class DependentDate < MasterControl::Models::Base
      attributes \
        :id,
        :app_model_id,
        :customer_app_state_id,
        :customer_id,
        :days_offset,
        :dependent_date_column_id,
        :is_dependent_date_in_future,
        :name,
        :reference_date_column_id,
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
              app_model_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_app_state_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              days_offset: { type: 'integer' },
              dependent_date_column_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              is_dependent_date_in_future: { type: 'boolean' },
              name: { type: 'string' },
              reference_date_column_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
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
              :app_model_id,
              :customer_app_state_id,
              :customer_id,
              :days_offset,
              :dependent_date_column_id,
              :is_dependent_date_in_future,
              :name,
              :reference_date_column_id,
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
