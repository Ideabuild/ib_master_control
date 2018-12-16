# frozen_string_literal: true
module MasterControl
  module Authentication
    class << self
      attr_accessor :configuration

      def configuration
        @configuration ||= MasterControl::Authentication::Configuration.new
      end

      def configure
        yield(configuration)
      end
    end
  end
end
