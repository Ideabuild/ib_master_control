# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::Base do
  describe 'attributes' do
    let(:subject) { described_class.new(object) }
    let(:object) { OpenStruct.new(version: MasterControl::VERSION, created_at: Time.now, updated_at: Time.now) }
    let(:attributes) { subject.attributes }

    specify { expect(attributes[:version]).to eq MasterControl::VERSION }
  end
end
