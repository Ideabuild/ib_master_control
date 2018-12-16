# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::Patient do
  NULLEABLE_ATTRIBUTES = [:address_1,
                          :address_2,
                          :city,
                          :customer_id,
                          :date_of_birth,
                          :deceased_date,
                          :email_address,
                          :first_name,
                          :gender,
                          :is_deceased,
                          :last_name,
                          :last_modified,
                          :marital_status,
                          :middle_initial,
                          :chart_number,
                          :phone_number,
                          :ssn,
                          :state,
                          :zip,
                          :zip_plus_four].freeze

  let(:canonical_klass) { 'MasterControl::Models::Patient' }
  let(:version) { '1.1.0' }
  let(:address_1) { Faker::Address.street_address }
  let(:address_2) { Faker::Address.secondary_address }
  let(:city) { Faker::Address.city }
  let(:customer_id) { SecureRandom.uuid }
  let(:date_of_birth) { Faker::Company.name }
  let(:deceased_date) { nil }
  let(:email_address) { nil }
  let(:first_name) { Faker::Name.first_name }
  let(:gender) { 1 }
  let(:is_deceased) { 0 }
  let(:last_name) { Faker::Name.last_name }
  let(:last_modified) { Faker::Time.backward(14, :evening) }
  let(:marital_status) { 0 }
  let(:middle_initial) { 'Z' }
  let(:chart_number) { Faker::Number.number(6) }
  let(:phone_number) { '(912)557-4345' }
  let(:ssn) { '323-323-3232' }
  let(:state) { Faker::Address.state_abbr }
  let(:zip) { Faker::Address.zip_code }
  let(:zip_plus_four) { Faker::Address.zip_code }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }

  let(:patient) do
    {
      canonical_klass: canonical_klass,
      version: version,
      address_1: address_1,
      address_2: address_2,
      city: city,
      customer_id: customer_id,
      date_of_birth: date_of_birth,
      deceased_date: deceased_date,
      email_address: email_address,
      first_name: first_name,
      gender: gender,
      is_deceased: is_deceased,
      last_name: last_name,
      last_modified: last_modified,
      marital_status: marital_status,
      middle_initial: middle_initial,
      chart_number: chart_number,
      phone_number: phone_number,
      ssn: ssn,
      state: state,
      zip: zip,
      created_at: created_at,
      updated_at: updated_at
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::Patient.json_schema, patient)
  end

  context 'happy path' do
    specify { expect { validate! }.to_not raise_error }
  end

  describe 'required attributes (not nil)' do
    [
      :canonical_klass,
      :version,
      :created_at,
      :updated_at
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
