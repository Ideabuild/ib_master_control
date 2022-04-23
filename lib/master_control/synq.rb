# frozen_string_literal: true
module MasterControl
  module Synq
    class << self
      attr_accessor :configuration

      def configuration
        @configuration ||= MasterControl::Synq::Configuration.new
      end

      def configure
        yield(configuration)

        create_exchanges
        bind_queues
      rescue Bunny::TCPConnectionFailedForAllHosts,
             AMQ::Protocol::EmptyResponseError,
             Timeout::Error,
             Errno::ECONNRESET => ex
        handle_connection_error(ex)
      end

      def create_exchanges
        configuration.exchanges.each do |exchange|
          MasterControl::Synq::Exchange.create(exchange)       
        end
      end

      def bind_queues
        configuration.subscribers.each do |exchange, subscriber|
          MasterControl::Synq::Exchange.create(exchange)
          MasterControl::Synq::Queue.bind(exchange, subscriber)
        end
      end

      def handle_connection_error(ex)
        logger.error "Error connecting to RabbitMQ: [#{ex.message}] for #{ENV['RABBITMQ_URL']}" if logger

        title = 'Error connecting to RabbitMQ'
        message = 'This error was suppressed and not re-thrown ' \
                  'the application should continue to function ' \
                  'but this issue should be addressed as soon as possible'

                  MasterControl::ErrorHandler.notify(ex, title: title, message: message)
      end

      def logger
        MasterControl.configuration.logger
      end
    end
  end
end
