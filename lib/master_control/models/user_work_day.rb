# frozen_string_literal: true
module MasterControl
  module Models
    class UserWorkDay < MasterControl::Models::Base
      attributes \
        :id,
        :day_end_seconds,
        :day_index,
        :day_start_seconds,
        :is_work_day,
        :lunch_end_seconds,
        :lunch_start_seconds,
        :user_id,
        :version,
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
              version: { type: 'integer' },
              active: { type: 'boolean' },
              day_end_seconds: { type: ['integer', 'null'] },
              day_index: { type: 'integer' },
              day_start_seconds: { type: ['integer', 'null'] },
              is_work_day: { type: 'boolean' },
              lunch_end_seconds: { type: ['integer', 'null'] },
              lunch_start_seconds: { type: ['integer', 'null'] },
              user_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              created_at: { type: 'string', format: 'date-time' },
              updated_at: { type: 'string', format: 'date-time' },
              updated_by_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              created_by_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] }
            },
            required: [
              :canonical_klass,
              :master_control_version,
              :version,
              :id,
              :active,
              :day_index,
              :is_work_day,
              :user_id,
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
