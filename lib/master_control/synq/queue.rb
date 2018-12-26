# frozen_string_literal: true
module MasterControl
  module Synq
    class Queue
      class << self
        def bind(exchange, queue)
          rabbitmq_queue(queue).bind(exchange)
        end

        private

        def rabbitmq_queue(queue_name)
          rabbitmq_channel.queue(
            queue_name,
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
