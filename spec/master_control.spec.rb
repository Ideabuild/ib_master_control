# frozen_string_literal: true
require 'spec_helper'

describe MasterControl do
  it 'has a version number' do
    expect(MasterControl::VERSION).not_to be nil
  end

  describe 'configure' do
    describe '.application' do
      let(:application) { 'SPEC' }

      before do
        MasterControl.configure do |config|
          config.application = application
        end
      end

      it 'sets the application' do
        expect(MasterControl.configuration.application).to eq(application)
      end
    end

    describe '.environment' do
      let(:environment) { 'spec_env' }

      before do
        MasterControl.configure do |config|
          config.environment = environment
        end
      end

      it 'sets the environment' do
        expect(MasterControl.configuration.environment).to eq(environment)
      end
    end

    describe '.logger' do
      let(:logger) { double('logger', error: true, warn: true, info: true, debug: true) }

      before do
        MasterControl.configure do |config|
          config.logger = logger
        end
      end

      it 'uses the application from the top level config' do
        expect(MasterControl.configuration.logger).to eq(logger)
      end
    end
  end
end
