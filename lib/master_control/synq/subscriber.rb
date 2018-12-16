# frozen_string_literal: true
module MasterControl
  module Synq
    module Subscriber
      extend ActiveSupport::Concern

      included do |base|
        include Sneakers::Worker

        base.send :include, InstanceMethods
        base.extend ClassMethods

        # define which queue this subscriber reads from (uses Synq::Queue to determine appropriate name)
        # env is set to nil since by default the actual queue name would be "gatekeeper.users_development"
        from_queue queue_name, env: nil

        def self.queue_name
          MasterControl::Synq::Queue.queue_name(self)
        end
      end

      module ClassMethods
        def event_handler(handlers)
          @event_handlers ||= {}
          @event_handlers.merge! handlers
        end

        def event_handlers
          @event_handlers
        end
      end

      module InstanceMethods
        # work method receives message payload in raw format in our case it is JSON encoded string
        # pass on to actual class with the items broken out
        # this encapsulates the serialization / deserialization without needing to change individual subscribers
        def work(payload)
          event, serialized_object = parse_payload(payload)
          object = MasterControl::Synq::Serializer.deserialize(serialized_object)

          process(event, object)
        end

        # This method can be overwritten by the implementing class if processing follows a different pattern
        def process(event, object)
          handler = self.class.event_handlers[event.to_sym]

          if handler.nil?
            message = "#{self.class}#process: Unable to process event [#{event}] with object: [#{object}]"

            raise ArgumentError, message
          end

          send(handler, object)

          ack!
        end

        private

        def parse_payload(payload)
          message = MasterControl::Synq::Serializer.deserialize(payload)

          [message[:event], message[:object]]
        end
      end
    end
  end
end
