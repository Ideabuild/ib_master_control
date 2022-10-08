# frozen_string_literal: true
module MasterControl
  module Models
    class Facility < MasterControl::Models::Base
      attributes \
        :id,
        :aasm_state,
        :attendance_due_day,
        :attending_provider_id,
        :bcbs_carrier_eligibility_id,
        :customer_app_state_id,
        :customer_id,
        :emr_login,
        :emr_password,
        :emr_url,
        :facility_type_name,
        :facility_type_system_code,
        :has_emr,
        :is_medicaid,
        :is_medicare,
        :name,
        :primary_contact_id,
        :tax_id,
        :timezone_id,
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
              id: { type: 'string' },
              canonical_klass: { type: 'string' },
              master_control_version: { type: 'string' },
              is_sync_update: { type: 'boolean' },
              version: { type: 'integer' },
              active: { type: 'boolean' },
              aasm_state: { type: 'string' },
              attendance_due_day: { type: 'string' },
              attending_provider_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              bcbs_carrier_eligibility_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_app_state_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              customer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              emr_login: { type: ['string', 'null'] },
              emr_password: { type: ['string', 'null'] },
              emr_url: { type: ['string', 'null'] },
              facility_type_name: { type: 'string' },
              facility_type_system_code: { type: 'string' },
              has_emr: { type: 'boolean' },
              is_medicaid: { type: 'boolean' },
              is_medicare: { type: 'boolean' },
              name: { type: 'string' },
              primary_contact_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              tax_id: { type: 'string' },
              timezone_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
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
              :attendance_due_day,
              :attending_provider_id,
              :customer_id,
              :facility_type_name,
              :facility_type_system_code,
              :has_emr,
              :is_medicaid,
              :is_medicare,
              :name,
              :tax_id,
              :timezone_id,
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
