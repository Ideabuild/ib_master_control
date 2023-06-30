# frozen_string_literal: true
module MasterControl
  module Models
    class InsuranceCoverageMergeQueue < MasterControl::Models::Base
      attributes \
        :id,
        :aasm_state,
        :customer_app_state_id,
        :customer_id,
        :insurance_coverage_id,
        :merged_at,
        :merged_by_id,
        :merged_insurance_coverage_id,
        :notes,
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
              aasm_state: { type: 'string' },
              merged_at: { type: ['string','null'] },
              customer_app_state_id: { type: ['string','null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              insurance_coverage_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              merged_by_id: { type: ['string','null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              merged_insurance_coverage_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              notes: { type: ['string','null'] },
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
              :aasm_state,
              :customer_id,
              :insurance_coverage_id,
              :merged_insurance_coverage_id,
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
