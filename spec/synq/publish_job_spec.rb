# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Synq::PublishJob do
  subject(:job) { described_class.new }

  describe '#perform' do
    let(:exchange) { :example_exchange }
    let(:event) { :upsert }
    let(:serialized_object) { { id: 'ID', name: 'NAME' } }
    let(:publisher) { double(publish!: true) }
    let(:connection) { double(start: double) }

    before do
      allow(Bunny).to receive(:new).and_return(connection)
      allow(MasterControl::Synq::Publisher).to(
        receive('new')
        .with(
          exchange: exchange,
          event: event,
          object: serialized_object,
          rabbit_connection: connection
        )
        .and_return(publisher)
      )
    end

    def perform_job!
      job.perform(exchange: exchange, event: event, object: serialized_object)
    end

    context 'with valid arguments' do
      it 'calls publish! on an instance of Publisher' do
        expect(publisher).to receive('publish!')

        perform_job!
      end
    end
  end
end
