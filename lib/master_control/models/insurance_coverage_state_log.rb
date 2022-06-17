# frozen_string_literal: true
module MasterControl
  module Models
    class InsuranceCoverageStateLog < MasterControl::Models::Base
      attributes \
        :id,
        :insurance_coverage_id,
        :is_auto_completed,
        :logged_aasm_state,
        :state_in_at,
        :state_out_at,
        :time_in_state,
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
              insurance_coverage_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              is_auto_completed: { type: 'boolean' },
              logged_aasm_state: { type: 'string' },
              state_in_at: { type: 'string', format: 'date-time' },
              state_out_at: { type: ['string', 'null'], format: 'date-time' },
              time_in_state: {  type: ['integer', 'null'] },
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
              :insurance_coverage_id,
              :logged_aasm_state,
              :state_in_at,
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
