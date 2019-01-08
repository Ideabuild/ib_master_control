# frozen_string_literal: true
module MasterControl
  module Models
    class Medication < MasterControl::Models::Base
      attributes \
        :id,
        :name,
        :generic_name,
        :brand_name,
        :display_name,
        :route,
        :dose_form,
        :additional_dose_information,
        :strength,
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
              version: { type: 'integer' },
              active: { type: 'boolean' },
              name: { type: 'string' },
              generic_name: { type: 'string' },
              brand_name: { type: 'string' },
              display_name: { type: 'string' },
              route: { type: 'string' },
              dose_form: { type: 'string' },
              additional_dose_information: { type: 'string' },
              strength: { type: 'string' },
              search_terms: { type: 'string' },
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
              :name,
              :generic_name,
              :brand_name,
              :search_terms,
              :route,
              :dose_form,
              :additional_dose_information,
              :strength,
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
