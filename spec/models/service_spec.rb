# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::Service do
  NULLEABLE_ATTRIBUTES = [].freeze

  let(:canonical_klass) { 'MasterControl::Models::Service' }
  let(:master_control_version) { '1.0.0' }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:service_line_id) { SecureRandom.uuid }
  let(:service_level_id) { SecureRandom.uuid }
  let(:name) { 'Billing' }
  let(:system_code) { 'billing' }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:service) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      version: version,
      id: id,
      service_line_id: service_line_id,
      service_level_id: service_level_id,
      name: name,
      system_code: system_code,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::Service.json_schema, service)
  end

  context 'happy path' do
    specify { expect { validate! }.to_not raise_error }
  end

  describe 'required attributes (not nil)' do
    [
      :canonical_klass,
      :id,
      :service_line_id,
      :service_level_id,
      :master_control_version,
      :version,
      :name,
      :system_code,
      :created_at,
      :updated_at,
      :updated_by_id,
      :created_by_id
    ].each do |attribute|
      context attribute do
        let(attribute) { nil }

        specify { expect { validate! }.to raise_error JSON::Schema::ValidationError }
      end
    end
  end

  context 'nullable attributes' do
    NULLEABLE_ATTRIBUTES.each do |attribute|
      context attribute do
        let(attribute) { nil }

        specify { expect { validate! }.to_not raise_error }
      end
    end
  end

  context 'format validations' do
    [:created_at, :updated_at].each do |attribute|
      context attribute do
        let(attribute) { '' }

        specify { expect { validate! }.to raise_error JSON::Schema::ValidationError }
      end
    end
  end
end