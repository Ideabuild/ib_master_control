# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::PolicyHolder do
  NULLEABLE_ATTRIBUTES = [
    :middle_name, 
    :ssn,
    :email,
    :phone
  ].freeze

  let(:canonical_klass) { 'MasterControl::Models::PolicyHolder' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:active) { true }
  let(:customer_id) { SecureRandom.uuid }
  let(:date_of_birth) { Faker::Date.backward(days: 2500).to_s(:iso8601) }
  let(:first_name) { Faker::Name.first_name }
  let(:gender_id) { SecureRandom.uuid }
  let(:last_name) { Faker::Name.last_name }
  let(:middle_name) { 'Z' }
  let(:full_name) { Faker::Name.first_name  + ' ' + Faker::Name.last_name }
  let(:phone) { Faker::PhoneNumber.phone_number }
  let(:email) { Faker::Internet.email }
  let(:ssn) { Faker::IDNumber.valid }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }

  let(:policy_holder) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      active: active,
      customer_id: customer_id,
      first_name: first_name,
      middle_name: middle_name,
      last_name: last_name,
      full_name: full_name,
      date_of_birth: date_of_birth,
      gender_id: gender_id,
      ssn: ssn,
      phone: phone,
      email: email,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::PolicyHolder.json_schema, policy_holder)
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
      :full_name,
      :date_of_birth,
      :gender_id,
      :customer_id,
      :version,
      :created_at,
      :updated_at,
      :updated_by_id,
      :created_by_id,
      :active
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
