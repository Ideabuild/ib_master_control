# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::Guarantor do
  NULLEABLE_ATTRIBUTES = [:billing_system_id,
                          :billing_system,
                          :customer_id,
                          :first_name,
                          :last_name,
                          :middle_initial,
                          :address_1,
                          :address_2,
                          :city,
                          :state,
                          :zip,
                          :zip_plus_four,
                          :phone,
                          :last_modified].freeze

  let(:canonical_klass) { 'MasterControl::Models::Guarantor' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:address_1) { Faker::Address.street_address }
  let(:address_2) { Faker::Address.secondary_address }
  let(:city) { Faker::Address.city }
  let(:customer_id) { SecureRandom.uuid }
  let(:last_modified) { Faker::Time.backward(14, :evening) }
  let(:first_name) { Faker::Name.first_name }
  let(:last_name) { Faker::Name.last_name }
  let(:middle_initial) { 'J' }
  let(:phone) { '(707)422-1212' }
  let(:state) { Faker::Address.state_abbr }
  let(:zip) { Faker::Address.zip_code }
  let(:zip_plus_four) { Faker::Address.zip_code }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }

  let(:guarantor) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      address_1: address_1,
      address_2: address_2,
      first_name: first_name,
      last_name: last_name,
      middle_initial: middle_initial,
      city: city,
      customer_id: customer_id,
      last_modified: last_modified,
      phone: phone,
      state: state,
      zip: zip,
      zip_plus_four: zip_plus_four,
      created_at: created_at,
      updated_at: updated_at
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::Guarantor.json_schema, guarantor)
  end

  context 'happy path' do
    specify { expect { validate! }.to_not raise_error }
  end

  describe 'required attributes (not nil)' do
    [
      :canonical_klass,
      :master_control_version,
      :is_sync_update,
      :version,
      :id,
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
end
