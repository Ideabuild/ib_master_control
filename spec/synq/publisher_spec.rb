# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Synq::Publisher do
  let(:connection) { double }
  let(:rabbitmq_channel) { double }
  let(:rabbitmq_exchange) { double }
  let(:exchange) { 'example_klasses' }
  let(:klass) { double(name: 'ExampleKlass') }
  let(:object) do
    double(
      class: klass,
      id: 'ID',
      name: 'NAME',
      created_at: Time.now,
      serialize_for_publishing: serialized_object
    )
  end
  let(:serialized_object) { { id: 'ID', name: 'NAME' } }
  let(:event) { :upsert }
  let(:publisher) do
    described_class.new(rabbit_connection: connection, exchange: exchange, event: event, object: serialized_object)
  end

  before do |example|
    next if example.metadata[:skip_before]

    allow(connection).to receive(:create_channel).and_return(rabbitmq_channel)
    allow(rabbitmq_channel).to(receive(:close))
    allow(rabbitmq_channel).to(
      receive(:fanout)
      .with(exchange, durable: true)
      .and_return(rabbitmq_exchange)
    )

    allow(publisher).to(receive(:rabbitmq_channel).and_return(rabbitmq_channel))
    allow(MasterControl::Synq::Serializer).to receive(:serialize).with(object).and_return(serialized_object)
  end

  describe '.upsert' do
    before do
      allow(MasterControl::Synq::PublishJob).to receive(:perform_later)

      described_class.upsert(object)
    end

    it 'enqueues a PublishJob with the expected arguments' do
      expect(MasterControl::Synq::PublishJob).to(
        have_received(:perform_later).with(
          exchange: exchange,
          event: 'upsert',
          object: serialized_object
        )
      )
    end
  end

  describe '.publish' do
    let(:event) { :custom_event }

    before do
      allow(MasterControl::Synq::PublishJob).to receive(:perform_later)

      described_class.publish(event, object)
    end

    it 'enqueues a PublishJob with the expected arguments' do
      expect(MasterControl::Synq::PublishJob).to(
        have_received(:perform_later).with(
          exchange: exchange,
          event: 'custom_event',
          object: serialized_object
        )
      )
    end
  end

  describe '#publish!' do
    it 'sends the expected action to the expected exchange with the serialized object' do
      allow(publisher).to receive(:cleanup!)
      expect(rabbitmq_exchange).to receive(:publish).with(
        {
          event: 'upsert',
          object: serialized_object
        }.to_json
      )

      publisher.publish!
    end
  end
end
