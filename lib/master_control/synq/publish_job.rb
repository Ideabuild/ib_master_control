# frozen_string_literal: true
require 'connection_pool'

module MasterControl
  module Synq
    class PublishJob < ActiveJob::Base
      queue_as { :default }

      RABBIT_POOL_SIZE = ENV['RAILS_MAX_THREADS'] || 10
      RABBIT_CONNECTION = ConnectionPool.new(size: RABBIT_POOL_SIZE, timeout: 5) do
        Bunny.new(ENV['RABBITMQ_URL'], log_level: Logger::ERROR).tap(&:start)
      end

      def perform(exchange:, event:, object:)
        RABBIT_CONNECTION.with do |rabbit_connection|
          MasterControl::Synq::Publisher.new(
            rabbit_connection: rabbit_connection,
            exchange: exchange,
            event: event,
            object: object
          ).publish!
        end
      end
    end
  end
end
