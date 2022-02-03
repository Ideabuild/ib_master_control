# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::PolicyHolderAddress do
  NULLEABLE_ATTRIBUTES = [
                          :street2,
                          :city_id,
                          :state_id,
                          :zipcode_id,
                          :fips_code,
                          :latitude,
                          :longitude
  ].freeze

  let(:canonical_klass) { 'MasterControl::Models::PolicyHolderAddress' }
  let(:version) { 1 }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:id) { SecureRandom.uuid }
  let(:street1) { Faker::Address.street_address }
  let(:street2) { Faker::Address.secondary_address }
  let(:city) { Faker::Address.city }
  let(:city_id) { SecureRandom.uuid }
  let(:state) { Faker::Address.state_abbr }
  let(:state_id) { SecureRandom.uuid }
  let(:zipcode) { Faker::Address.zip_code }
  let(:zipcode_id) { SecureRandom.uuid }
  let(:fips_code) { '1212-23' }
  let(:latitude) { Faker::Address.latitude }
  let(:longitude) { Faker::Address.longitude }
  let(:policy_holder_id) { SecureRandom.uuid }
  let(:customer_id) { SecureRandom.uuid }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:policy_holder_address) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      street1: street1,
      street2: street2,
      city: city,
      city_id: city_id,
      state: state,
      state_id: state_id,
      zipcode: zipcode,
      zipcode_id: zipcode_id,
      fips_code: fips_code,
      latitude: latitude,
      longitude: longitude,
      policy_holder_id: policy_holder_id,
      customer_id: customer_id,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::PolicyHolderAddress.json_schema, policy_holder_address)
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
      :street1,
      :city,
      :state,
      :zipcode,
      :policy_holder_id,
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
