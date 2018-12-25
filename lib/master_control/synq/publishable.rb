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
          puts "--------self: #{self.to_json}"
          MasterControl::Synq::Publisher.publish(event, self)
        end

        def publish_complete
          publish(:complete)
        end

        def publish_upsert
          publish(:upsert) unless previous_changes.empty?
        end

        def publish_resolved
          publish(:resolved)
        end
      end
    end
  end
end
