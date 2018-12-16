# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Constants do
  describe 'Analytics' do
    specify { expect(MasterControl::Constants::AmdAnalytics::SYSTEM).to eq 'amd_analytics' }
  end

  describe 'InsuranceVerify' do
    specify { expect(MasterControl::Constants::InsuranceVerify::SYSTEM).to eq 'ib_insurance_verify' }
  end

  describe 'InsuranceAuthorize' do
    specify { expect(MasterControl::Constants::InsuranceAuthorize::SYSTEM).to eq 'ib_insurance_authorize' }
  end

  describe 'Authenticator' do
    specify { expect(MasterControl::Constants::Authenticator::SYSTEM).to eq 'ib_authenticator' }
  end

  describe 'AmdIntegrator' do
    specify { expect(MasterControl::Constants::AmdIntegrator::SYSTEM).to eq 'amd_integrator' }
  end

  describe 'HealthcarePortal' do
    specify { expect(MasterControl::Constants::HealthcarePortal::SYSTEM).to eq 'ib_healthcare_portal' }
  end

end
