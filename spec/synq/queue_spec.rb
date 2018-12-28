# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Synq::Queue do
  let(:application_name) { 'example_application' }
  let(:configuration) { double(application: application_name) }
  let(:rabbitmq_channel) { double }
  let(:rabbitmq_queue) { double }
  let(:exchange_name) { 'strings' }
  let(:subscriber_klass) { Array }
  let(:subscriber_object) { [] }
  let(:queue_name) { 'example_application.arrays' }

  before do
    allow(MasterControl).to receive(:configuration).and_return(configuration)

    allow(described_class).to(
      receive(:rabbitmq_channel)
      .and_return(rabbitmq_channel)
    )

    allow(rabbitmq_channel).to(
      receive(:queue)
      .with(queue_name, durable: true)
      .and_return(rabbitmq_queue)
    )

    allow(rabbitmq_queue).to(
      receive(:bind)
      .with(exchange_name)
    )
  end

  describe '.queue_name' do
    it 'derives the queue_name from the class' do
      expect(described_class.queue_name(subscriber_klass)).to eq queue_name
    end
  end

  describe '.bind' do
    def bind!
      described_class.bind(exchange_name, subscriber_klass)
    end

    it 'creates the queue' do
      expect(rabbitmq_channel).to receive(:queue).with(queue_name, durable: true)

      bind!
    end

    it 'binds the queue to the channel' do
      expect(rabbitmq_queue).to receive(:bind).with(exchange_name)

      bind!
    end
  end
end
