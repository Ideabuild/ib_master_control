# frozen_string_literal: true
module MasterControl
  module Synq
    class Queue
      class << self
        def bind(exchange, subscriber)
          rabbitmq_queue(subscriber).bind(exchange)
        end

        # UserAccountSubscriber => gatekeeper.user_account_subscribers
        def queue_name(subscriber_klass)
          "#{application}.#{subscriber_klass.name.tableize}"
        end

        private

        def rabbitmq_queue(queue_klass)
          rabbitmq_channel.queue(
            queue_name(queue_klass),
            durable: true
          )
        end

        def rabbitmq_connection
          @rabbitmq_connection ||= Bunny.new(ENV['RABBITMQ_URL'], log_level: Logger::ERROR).tap(&:start)
        end

        def rabbitmq_channel
          rabbitmq_connection.create_channel
        end

        def application
          MasterControl.configuration.application
        end
      end
    end
  end
end
