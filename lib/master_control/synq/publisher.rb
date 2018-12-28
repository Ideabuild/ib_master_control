# frozen_string_literal: true
module MasterControl
  module Synq
    class Publisher
      class << self
        def publish(event, object)
          enqueue(event, object)
        end

        def upsert(object)
          publish(:upsert, object)
        end

        private

        def enqueue(event, object)
          MasterControl::Synq::PublishJob.perform_later(
            exchange: object.class.name.tableize,
            event: event.to_s,
            object: MasterControl::Synq::Serializer.serialize(object)
          )
        end
      end

      attr_accessor :exchange, :event, :object, :rabbit_connection

      def initialize(exchange:, event:, object:, rabbit_connection:)
        @exchange = exchange
        @event = event
        @object = object
        @rabbit_connection = rabbit_connection
      end

      def publish!
        rabbitmq_exchange.publish(message)
        cleanup!
      end

      def cleanup!
        rabbitmq_channel.close
      end

      private

      def rabbitmq_exchange
        rabbitmq_channel.fanout(exchange, durable: true)
      end

      def message
        { event: event, object: object }.to_json
      end

      def rabbitmq_channel
        @channel ||= rabbit_connection.create_channel
      end
    end
  end
end
