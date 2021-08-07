# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::CustomerProvider do
  NULLEABLE_ATTRIBUTES = [
                          :employer_identification_number,
                          :credentials,
                          :prefix,
                          :suffix,
                          :other_name,
                          :other_first_name,
                          :other_middle_name,
                          :other_last_name
                          ].freeze

  let(:canonical_klass) { 'MasterControl::Models::CustomerProvider' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:customer_id) { SecureRandom.uuid }
  let(:provider_id) { SecureRandom.uuid }
  let(:gender_id) { SecureRandom.uuid }
  let(:id) { SecureRandom.uuid }
  let(:name) { Faker::Name.name }
  let(:first_name) { Faker::Name.first_name }
  let(:middle_name) { Faker::Name.middle_name }
  let(:last_name) { Faker::Name.last_name }
  let(:npi) { '01164749' }
  let(:employer_identification_number) { '01164749' }
  let(:credentials) { 'MD' }
  let(:prefix) { 'Dr.' }
  let(:suffix) { 'IV' }
  let(:other_name) { Faker::Name.name }
  let(:other_first_name) { Faker::Name.first_name }
  let(:other_middle_name) { Faker::Name.middle_name }
  let(:other_last_name) { Faker::Name.last_name }
  let(:provider_type_name) { "Individual" }
  let(:provider_type_code) { "individual" }
  let(:external_reference_identifier) { "ZooBoy" }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:active) { true }

  let(:customer_provider) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      customer_id: customer_id,
      provider_id: provider_id,
      gender_id: gender_id,
      id: id,
      name: name,
      first_name: first_name,
      middle_name: middle_name,
      last_name: last_name,
      npi: npi,
      employer_identification_number: employer_identification_number,
      credentials: credentials,
      prefix: prefix,
      suffix: suffix,
      other_name: other_name,
      other_first_name: other_first_name,
      other_middle_name: other_middle_name,
      other_last_name: other_last_name,
      provider_type_name: provider_type_name,
      provider_type_code: provider_type_code,
      external_reference_identifier: external_reference_identifier,
      created_at: created_at,
      updated_at: updated_at,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::CustomerProvider.json_schema, customer_provider)
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
      :name,
      :first_name,
      :last_name,
      :npi,
      :customer_id,
      :provider_id,
      :provider_type_name,
      :external_reference_identifier,
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
