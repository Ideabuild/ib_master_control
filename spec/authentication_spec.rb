# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Authentication do
  describe 'configure' do
    describe 'jwt_secret' do
      let(:jwt_secret) { 'SPEC-JWT-SECRET' }

      before do
        MasterControl::Authentication.configure do |config|
          config.jwt_secret = jwt_secret
        end
      end

      it 'sets the jwt_secret' do
        expect(MasterControl::Authentication.configuration.jwt_secret).to eq(jwt_secret)
      end
    end
  end
end
