# frozen_string_literal: true
require 'spec_helper'

RSpec.describe ExampleSubscriber do
  let(:subscriber) { described_class.new }
  let(:object) { { canonical_klass: 'MasterControl::Models::Role', id: 'ID', name: 'OBJECT' } }
  let(:event) { 'example_upsert_event' }
  let(:serialized_object) { object.to_json }
  let(:payload) { { event: event, object: serialized_object }.to_json }

  before do
    allow(MasterControl::Synq::Queue).to receive(:queue_name).and_return('SPEC-QUEUE-NAME')
    allow(subscriber).to receive(:ack!)
    allow(subscriber).to receive(:upsert_example_object)
    allow(subscriber).to receive(:delete_example_object)
  end

  def work!
    subscriber.work(payload)
  end

  describe '#work' do
    before { allow(subscriber).to receive(:process) }

    it 'calls #process with parsed payload' do
      expect(subscriber).to receive(:process).with(event, object)

      subscriber.work(payload)
    end
  end

  describe '#process' do
    context 'with a valid event and object' do
      before { work! }

      it 'calls the handler method' do
        expect(subscriber).to have_received(:upsert_example_object).with(object)
      end

      it 'calls ack!' do
        expect(subscriber).to have_received(:ack!)
      end
    end

    context 'with an unknown event' do
      let(:event) { 'unknown_event' }

      it 'raises an error' do
        expect { work! }.to raise_error ArgumentError
      end
    end
  end

  describe '.queue_name' do
    it 'delegates to the Synq::Queue object' do
      expect(described_class.queue_name).to eq 'SPEC-QUEUE-NAME'
    end
  end

  describe '#event_handlers' do
    before { work! }

    context 'when defined' do
      specify { expect(subscriber).to have_received(:upsert_example_object).with(object) }
    end

    context 'a second event' do
      let(:event) { :example_delete_event }

      specify { expect(subscriber).to have_received(:delete_example_object).with(object) }
    end
  end
end
