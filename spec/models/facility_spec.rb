# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::Facility do
  NULLEABLE_ATTRIBUTES = [
    :bcbs_carrier_eligibility_id,
    :emr_login,
    :emr_password,
    :emr_password,
    :primary_contact_id,
  ].freeze

  let(:canonical_klass) { 'MasterControl::Models::Facility' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:aasm_state) { 'the_state' }
  let(:attendance_due_day) { 'Wednesday' }
  let(:attending_provider_id) { SecureRandom.uuid }
  let(:bcbs_carrier_eligibility_id) { SecureRandom.uuid }
  let(:customer_app_state_id) { SecureRandom.uuid }
  let(:customer_id) { SecureRandom.uuid }
  let(:emr_login) { Faker::Internet.username }
  let(:emr_password) { Faker::Internet.password }
  let(:emr_url) { Faker::Internet.url }
  let(:has_emr) { Faker::Boolean.boolean }
  let(:is_medicaid) { Faker::Boolean.boolean }
  let(:is_medicare) { Faker::Boolean.boolean }
  let(:facility_type_name) { 'Rehab' }
  let(:facility_type_system_code) { 'rehab' }
  let(:name) { Faker::Company.name }
  let(:primary_contact_id) { SecureRandom.uuid }
  let(:tax_id) { Faker::Company.french_siret_number }
  let(:timezone_id) { SecureRandom.uuid }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:facility) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      aasm_state: aasm_state,
      attendance_due_day: attendance_due_day,
      attending_provider_id: attending_provider_id,
      bcbs_carrier_eligibility_id: bcbs_carrier_eligibility_id,
      customer_app_state_id: customer_app_state_id,
      customer_id: customer_id,
      emr_login: emr_login,
      emr_password: emr_password,
      emr_url: emr_url,
      facility_type_name: facility_type_name,
      facility_type_system_code: facility_type_system_code,
      has_emr: has_emr,
      is_medicaid: is_medicaid,
      is_medicare: is_medicare,
      name: name,
      primary_contact_id: primary_contact_id,
      tax_id: tax_id,
      timezone_id: timezone_id,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::Facility.json_schema, facility)
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
      :aasm_state,
      :attendance_due_day,
      :attending_provider_id,
      :customer_app_state_id,
      :customer_id,
      :facility_type_name,
      :facility_type_system_code,
      :has_emr,
      :is_medicaid,
      :is_medicare,
      :name,
      :tax_id,
      :timezone_id,
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
