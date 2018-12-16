# frozen_string_literal: true
module MasterControl
  class Configuration
    attr_accessor \
      :application,
      :environment,
      :logger

    def initialize
      @application = nil
      @environment = nil
      @logger = nil
    end
  end
end
