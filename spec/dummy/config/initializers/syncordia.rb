# frozen_string_literal: true
MasterControl.configure do |config|
  config.application = 'spec_dummy_application'
  config.environment = 'test'
  config.logger = Rails.logger
end
