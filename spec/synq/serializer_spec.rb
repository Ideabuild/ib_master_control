# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Synq::Serializer do
  describe 'canonical_klass' do
    context 'when canonical class exists' do
      let(:klass) { MasterControl::Models::Role.new(id: '1', name: 'name') }

      specify { expect(described_class.send(:canonical_klass, klass)).to eq MasterControl::Models::Role }
    end

    context 'when canonical class does not exist' do
      let(:klass) { 'Dummy' }

      specify { expect { described_class.canonical_klass(klass) }.to raise_error }
    end
  end

  describe 'serialize' do
  end

  describe 'deserialize' do
  end
end
