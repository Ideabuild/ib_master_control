# frozen_string_literal: true
module MasterControl
  module Synq
    class Configuration
      attr_accessor \
        :exchanges,
        :queues

      def initialize
        @exchanges = []
        @queues = []
      end
    end
  end
end
