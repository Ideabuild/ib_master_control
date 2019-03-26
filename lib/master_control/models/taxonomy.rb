# frozen_string_literal: true
module MasterControl
  module Models
    class Taxonomy < MasterControl::Models::Base
      attributes \
        :id,
        :taxonomy_code,
        :taxonomy_type,
        :taxonomy_classification,
        :taxonomy_specialization,
        :definition,
        :notes,
        :search_terms,
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
              is_sync_update: { type: 'boolean' },
              version: { type: 'integer' },
              active: { type: 'boolean' },
              taxonomy_code: { type: 'string' },
              taxonomy_type: { type: 'string' },
              taxonomy_classification: { type: 'string' },
              taxonomy_specialization: { type: 'string' },
              definition: { type: ['string', 'null'] },
              notes: { type: ['string', 'null'] },
              search_terms: { type: 'string' },
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
              :taxonomy_code,
              :taxonomy_type,
              :taxonomy_classification,
              :taxonomy_specialization,
              :search_terms,
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
