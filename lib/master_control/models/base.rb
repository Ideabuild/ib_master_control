# frozen_string_literal: true
module MasterControl
  module Models
    class Base < ActiveModel::Serializer
      attributes \
        :canonical_klass,
        :master_control_version
        :is_sync_update

      attribute :created_at_string, key: :created_at
      attribute :updated_at_string, key: :updated_at

      def master_control_version
        MasterControl::VERSION
      end

      def is_sync_update
        true
      end

      def canonical_klass
        self.class.name
      end

      def created_at_string
        datetime_to_string(object.created_at)
      end

      def updated_at_string
        datetime_to_string(object.updated_at)
      end

      protected

      def datetime_to_string(dt)
        dt.to_s(:iso8601)
      end
    end
  end
end
