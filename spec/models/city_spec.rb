# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::City do
  NULLEABLE_ATTRIBUTES = [].freeze

  let(:canonical_klass) { 'MasterControl::Models::City' }
  let(:master_control_version) { '1.0.0' }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:name) { "happy Town" }
  let(:fips_code) { 'blue' }
  let(:ansi_code) { 'blue' }
  let(:county_fips_code) { '124' }
  let(:state_fips_code) { '124' }
  let(:latitude) { 12.1235 }
  let(:longitude) { 12.3566 }
  let(:population) { 123 }
  let(:state_id) { SecureRandom.uuid }
  let(:county_id) { SecureRandom.uuid }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:city) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      version: version,
      id: id,
      name: name,
      fips_code: fips_code,
      ansi_code: ansi_code,
      county_fips_code: county_fips_code,
      state_fips_code: state_fips_code,
      latitude: latitude,
      longitude: longitude,
      population: population,
      state_id: state_id,
      county_id: county_id,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::City.json_schema, city)
  end

  context 'happy path' do
    specify { expect { validate! }.to_not raise_error }
  end

  describe 'required attributes (not nil)' do
    [
      :canonical_klass,
      :id,
      :master_control_version,
      :version,
      :name,
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