# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::Facility do
  NULLEABLE_ATTRIBUTES = [].freeze

  let(:canonical_klass) { 'MasterControl::Models::Facility' }
  let(:version) { '1.0.0' }
  let(:id) { SecureRandom.uuid }
  let(:name) { Faker::Company.name }
  let(:customer_id) { SecureRandom.uuid }
  let(:facility_type_id) { SecureRandom.uuid }
  let(:facility_type_name) { 'Overnight' }
  let(:aasm_state) { 'new' }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:facility) do
    {
      canonical_klass: canonical_klass,
      version: version,
      id: id,
      name: name,
      customer_id: customer_id,
      facility_type_id: facility_type_id,
      facility_type_name: facility_type_name,
      aasm_state: aasm_state,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::Facility.json_schema, facility)
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
      :customer_id,
      :facility_type_id,
      :facility_type_name,
      :aasm_state,
      :created_at,
      :updated_at,
      :updated_by_id
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
