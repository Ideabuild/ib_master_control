# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::AddressType do
  NULLEABLE_ATTRIBUTES = [].freeze

  let(:canonical_klass) { 'MasterControl::Models::AddressType' }
  let(:version) { '1.0.0' }
  let(:id) { SecureRandom.uuid }
  let(:name) { 'Billing' }
  let(:system_code) { 'billing' }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by) { SecureRandom.uuid }
  let(:active) { true }

  let(:address_type) do
    {
      canonical_klass: canonical_klass,
      version: version,
      id: id,
      name: name,
      system_code: system_code,
      created_at: created_at,
      updated_at: updated_at,
      updated_by: updated_by,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::AddressType.json_schema, address_type)
  end

  context 'happy path' do
    specify { expect { validate! }.to_not raise_error }
  end

  describe 'required attributes (not nil)' do
    [
      :canonical_klass,
      :id,
      :version,
      :name,
      :system_code,
      :created_at,
      :updated_at,
      :updated_by
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
