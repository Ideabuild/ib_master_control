# frozen_string_literal: true
module MasterControl
  module Synq
    class Configuration
      attr_accessor \
        :exchanges,
        :subscribers

      def initialize
        @exchanges = []
        @subscribers = {}
      end
    end
  end
end
