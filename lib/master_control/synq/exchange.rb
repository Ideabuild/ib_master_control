# frozen_string_literal: true
module MasterControl
  module Synq
    class Exchange
      class << self
        def create(name)
          rabbitmq_channel.fanout(name.to_s, durable: true)
        end

        private

        def rabbitmq_connection
          @rabbitmq_connection ||= Bunny.new(ENV['RABBITMQ_URL'], log_level: Logger::ERROR).tap(&:start)
        end

        def rabbitmq_channel
          rabbitmq_connection.create_channel
        end
      end
    end
  end
end
