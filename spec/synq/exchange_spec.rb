# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Synq::Exchange do
  let(:rabbitmq_channel) { double }

  before do
    allow(described_class).to(
      receive(:rabbitmq_channel).and_return(rabbitmq_channel)
    )

    allow(rabbitmq_channel).to receive(:fanout)
  end

  describe '.create' do
    it 'creates the channel' do
      expect(rabbitmq_channel).to receive(:fanout).with('example', durable: true)

      described_class.create(:example)
    end
  end
end
