# frozen_string_literal: true
require 'active_job'
require 'active_model_serializers'
require 'active_support/all'
require 'jwt'
require 'json-schema'
require 'sneakers'

require_relative 'master_control/models/base'

# include all of the files inside the `lib/master_control` folder EXCEPT the `spec_helpers` file / folder
Gem.find_files('master_control/**/*.rb').each { |path| require path unless path.include? 'spec' }

module MasterControl
  class << self
    attr_accessor :configuration

    def configuration
      @configuration ||= MasterControl::Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end
