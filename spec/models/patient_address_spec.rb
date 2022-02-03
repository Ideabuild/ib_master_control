# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::PatientAddress do
  NULLEABLE_ATTRIBUTES = [
                          :street_2,
                          :city_id,
                          :state_id,
                          :zipcode_id,
                          :fips_code,
                          :latitude,
                          :longitude
  ].freeze

  let(:canonical_klass) { 'MasterControl::Models::PatientAddress' }
  let(:version) { 1 }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:id) { SecureRandom.uuid }
  let(:street_1) { Faker::Address.street_address }
  let(:street_2) { Faker::Address.secondary_address }
  let(:city_name) { Faker::Address.city }
  let(:city_id) { SecureRandom.uuid }
  let(:state_name) { Faker::Address.state_abbr }
  let(:state_id) { SecureRandom.uuid }
  let(:zipcode_value) { Faker::Address.zip_code }
  let(:zipcode_id) { SecureRandom.uuid }
  let(:fips_code) { '1212-23' }
  let(:latitude) { Faker::Address.latitude }
  let(:longitude) { Faker::Address.longitude }
  let(:patient_id) { SecureRandom.uuid }
  let(:customer_id) { SecureRandom.uuid }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:patient_address) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      street_1: street_1,
      street_2: street_2,
      city_name: city_name,
      city_id: city_id,
      state_name: state_name,
      state_id: state_id,
      zipcode_value: zipcode_value,
      zipcode_id: zipcode_id,
      fips_code: fips_code,
      latitude: latitude,
      longitude: longitude,
      patient_id: patient_id,
      customer_id: customer_id,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::PatientAddress.json_schema, patient_address)
  end

  context 'happy path' do
    specify { expect { validate! }.to_not raise_error }
  end

  describe 'required attributes (not nil)' do
    [
      :canonical_klass,
      :id,
      :master_control_version,
      :is_sync_update,
      :version,
      :street_1,
      :city_name,
      :state_name,
      :zipcode_value,
      :patient_id,
      :customer_id,
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
