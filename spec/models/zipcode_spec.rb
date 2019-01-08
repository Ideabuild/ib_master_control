# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::Zipcode do
  NULLEABLE_ATTRIBUTES = [].freeze

  let(:canonical_klass) { 'MasterControl::Models::Zipcode' }
  let(:master_control_version) { '1.0.0' }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:zipcode) { '95403' }
  let(:zipcode_type) { 'blue' }
  let(:city_id) { SecureRandom.uuid }
  let(:county_id) { SecureRandom.uuid }
  let(:state_id) { SecureRandom.uuid }
  let(:timezone) { 'pacific' }
  let(:utc_offset) { 8 }
  let(:latitude) { 12.1235 }
  let(:longitude) { 12.3566 }
  let(:is_daylight_savings) { true}
  let(:msa_code) { 'code here' }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:zipcode_object) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      version: version,
      id: id,
      zipcode: zipcode,
      zipcode_type: zipcode_type,
      city_id: city_id,
      county_id: county_id,
      state_id: state_id,
      timezone: timezone,
      utc_offset: utc_offset,
      latitude: latitude,
      longitude: longitude,
      is_daylight_savings: is_daylight_savings,
      msa_code: msa_code,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::Zipcode.json_schema, zipcode_object)
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
      :zipcode,
      :city_id,
      :county_id,
      :state_id,
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
