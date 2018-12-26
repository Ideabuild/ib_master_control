# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Synq do
  describe 'configure' do
    let(:exchanges) { [] }
    let(:queues) { [] }

    def configure!
      MasterControl::Synq.configure do |config|
        config.exchanges = exchanges
        config.queues = queues
      end
    end

    before do |example|
      next if example.metadata[:skip_before]

      allow(MasterControl::Synq::Exchange).to receive(:create)
      allow(MasterControl::Synq::Queue).to receive(:bind)

      configure!
    end

    context 'with exchanges' do
      let(:exchanges) { [:first_exchange, :second_exchange] }

      it 'creates the exchanges' do
        expect(MasterControl::Synq::Exchange).to have_received(:create).with(:first_exchange).ordered
        expect(MasterControl::Synq::Exchange).to have_received(:create).with(:second_exchange).ordered
      end
    end

    context 'with queues' do
      let(:exchanges) do
          [:first_exchange,
          :second_exchange]
      end

      let(:queues) do
          [:first_queue, :second_queue]
      end

      it 'creates the exchanges' do
        expect(MasterControl::Synq::Exchange).to have_received(:create).with(:first_exchange).ordered
        expect(MasterControl::Synq::Exchange).to have_received(:create).with(:second_exchange).ordered
      end

      it 'binds the queues' do
        expect(MasterControl::Synq::Queue).to have_received(:bind).with(:first_exchange, :first_queue).ordered
        expect(MasterControl::Synq::Queue).to have_received(:bind).with(:first_exchange, :second_queue).ordered
        expect(MasterControl::Synq::Queue).to have_received(:bind).with(:second_exchange, :first_queue).ordered
        expect(MasterControl::Synq::Queue).to have_received(:bind).with(:second_exchange, :second_queue).ordered
      end
    end

    context 'when cannot connect to rabbitmq', :skip_before do
      let(:exchanges) { [:fail] }
      let(:exception) { nil }
      let(:logger) { double('logger', error: true, warn: true, info: true, debug: true) }

      before do
        allow(MasterControl::Synq).to receive(:logger).and_return(logger)
        allow(Bunny).to receive(:new).and_raise exception
      end

      context 'rabbitmq is not started' do
        let(:exception) { Bunny::TCPConnectionFailedForAllHosts }

        it 'captures the error' do
          expect { configure! }.to_not raise_error
        end
      end

      context 'other unexpected errors' do
        let(:exception) { RuntimeError }

        it 'allows the error to bubble up' do
          expect { configure! }.to raise_error RuntimeError
        end
      end
    end
  end
end
