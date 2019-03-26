# frozen_string_literal: true
module MasterControl
  module Synq
    module Publishable
      extend ActiveSupport::Concern

      included do |base|
        base.send :include, InstanceMethods
        base.extend ClassMethods
      end

      module ClassMethods
      end

      module InstanceMethods
        def publish(event)
          MasterControl::Synq::Publisher.publish(event, self)
        end

        def publish_complete
          publish(:complete)
        end

        def publish_upsert
          if (!previous_changes.empty? && self.is_sync_update)
            publish(:upsert) unless previous_changes.empty?
          end
        end

        def publish_resolved
          publish(:resolved)
        end
      end
    end
  end
end
