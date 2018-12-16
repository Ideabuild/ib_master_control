# frozen_string_literal: true

# Load spec/dummy files
require File.expand_path('../dummy/config/environment', __FILE__)

# Load gems used in testing
require 'faker'
require 'rspec'
require 'rspec/rails'

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load the actual gem files last
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'master_control'
require 'master_control/spec_helpers'

RSpec.configure do |config|
  config.include ActiveModelSerializers::Test::Schema, file_path: %r{ spec\/models\/ }
end

ActiveModelSerializers.config.schema_path = 'models/schemas'
