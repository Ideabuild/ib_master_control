# frozen_string_literal: true
module MasterControl
  module Authentication
    class Configuration
      attr_accessor :jwt_secret

      def initialize
        @jwt_secret = []
      end
    end
  end
end
