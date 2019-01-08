# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::Address do
  NULLEABLE_ATTRIBUTES = [
                          :street2,
                          :city_id,
                          :state_id,
                          :zipcode_id,
                          :phone_number,
                          :fax_number,
                          :fips_code,
                          :latitude,
                          :longitude
  ].freeze

  let(:canonical_klass) { 'MasterControl::Models::Address' }
  let(:version) { 1 }
  let(:master_control_version) { '1.0.0' }
  let(:id) { SecureRandom.uuid }
  let(:street1) { Faker::Address.street_address }
  let(:street2) { Faker::Address.secondary_address }
  let(:city) { Faker::Address.city }
  let(:city_id) { SecureRandom.uuid }
  let(:state) { Faker::Address.state_abbr }
  let(:state_id) { SecureRandom.uuid }
  let(:zipcode) { Faker::Address.zip_code }
  let(:zipcode_id) { SecureRandom.uuid }
  let(:phone_number) { Faker::PhoneNumber.phone_number }
  let(:fax_number) { Faker::PhoneNumber.cell_phone }
  let(:fips_code) { '1212-23' }
  let(:latitude) { Faker::Address.latitude }
  let(:longitude) { Faker::Address.longitude }
  let(:parent_id) { SecureRandom.uuid }
  let(:parent_type) { 'patient' }
  let(:address_type_id) { SecureRandom.uuid }
  let(:aasm_state) { 'new' }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:address) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
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
      phone_number: phone_number,
      fax_number: fax_number,
      fips_code: fips_code,
      latitude: latitude,
      longitude: longitude,
      parent_id: parent_id,
      parent_type: parent_type,
      address_type_id: address_type_id,
      aasm_state: aasm_state,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::Address.json_schema, address)
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
      :street1,
      :city,
      :state,
      :zipcode,
      :parent_id,
      :parent_type,
      :address_type_id,
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
