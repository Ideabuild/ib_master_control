# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::Patient do
  NULLEABLE_ATTRIBUTES = [:middle_name].freeze

  let(:canonical_klass) { 'MasterControl::Models::Patient' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:customer_id) { SecureRandom.uuid }
  let(:date_of_birth) { Faker::Date.backward(2500).to_s(:iso8601) }
  let(:first_name) { Faker::Name.first_name }
  let(:gender_id) { SecureRandom.uuid }
  let(:is_deceased) { false }
  let(:last_name) { Faker::Name.last_name }
  let(:middle_name) { 'Z' }
  let(:chart_number) { 'TRRA0000' }
  let(:ssn) { Faker::IDNumber.valid }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }

  let(:patient) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      customer_id: customer_id,
      first_name: first_name,
      middle_name: middle_name,
      last_name: last_name,
      date_of_birth: date_of_birth,
      gender_id: gender_id,
      is_deceased: is_deceased,
      chart_number: chart_number,
      ssn: ssn,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id
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
      :master_control_version,
      :is_sync_update,
      :first_name,
      :last_name,
      :date_of_birth,
      :gender_id,
      :customer_id,
      :ssn,
      :chart_number,
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
