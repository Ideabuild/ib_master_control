# frozen_string_literal: true
module MasterControl
  module Models
    class WorkQueue < MasterControl::Models::Base
      attributes \
        :id,
        :work_group_id,
        :customer_id,
        :name,
        :system_code,
        :is_group_by_queue,
        :is_role_based,
        :group_by_model_association_id,
        :group_by_column_id,
        :max_assignable_per_user,
        :max_group_assignable_by_user,
        :order_by_type_name,
        :order_by_type_system_code,
        :order_by_model_association_id,
        :order_by_column_id,
        :order_by_direction,
        :priority_level,
        :priority_level_adjustment,
        :roles,
        :users,
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
              customer_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              work_group_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              name: { type: 'string' },
              system_code: { type: 'string' },
              is_group_by_queue: { type: 'boolean' },
              is_role_based: { type: 'boolean' },
              group_by_model_association_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              group_by_column_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              max_assignable_per_user: { type: 'integer' },
              max_group_assignable_by_user: { type: 'integer' },
              order_by_type_name: { type: 'string' },
              order_by_type_system_code: { type: 'string' },
              order_by_model_association_id: { type: ['string', 'null'], pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              order_by_column_id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] },
              order_by_direction: { type: 'string' },
              priority_level: { type: 'integer' },
              priority_level_adjustment: { type: 'integer' },
              roles: {
                type: 'array',
                items: {
                  type: 'object',
                  properties: {
                    id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] }
                  }
                }
              },
              users: {
                type: 'array',
                items: {
                  type: 'object',
                  properties: {
                    id: { type: 'string', pattern: JSON_SCHEMA_PATTERNS[:uuid] }
                  }
                }
              },
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
              :customer_id,
              :work_group_id,
              :name,
              :system_code,
              :is_group_by_queue,
              :is_role_based,
              :max_assignable_per_user,
              :max_group_assignable_by_user,
              :order_by_type_name,
              :order_by_type_system_code,
              :priority_level,
              :priority_level_adjustment,
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
