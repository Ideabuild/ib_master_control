# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::ThirdPartyAdmin do
  NULLEABLE_ATTRIBUTES = [].freeze

  let(:canonical_klass) { 'MasterControl::Models::ThirdPartyAdmin' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:name) { 'Billing' }
  let(:system_code) { 'billing' }
  let(:email) { 'Patient' }
  let(:phone) { 'patient' }
  let(:fax) { 'patient' }
  let(:url) { 'patient' }
  let(:third_party_admin_type_id) { SecureRandom.uuid }
  let(:third_party_admin_type_name) { 'Patient' }
  let(:third_party_admin_type_system_code) { 'patient' }
  let(:carriers) { [{ id: SecureRandom.uuid, name: 'BCBS' }] }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:third_party_admin) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      name: name,
      system_code: system_code,
      email: email,
      phone: phone,
      fax: fax,
      url: url,
      third_party_admin_type_id: third_party_admin_type_id,
      third_party_admin_type_name: third_party_admin_type_name,
      third_party_admin_type_system_code: third_party_admin_type_system_code,
      carriers: carriers,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::ThirdPartyAdmin.json_schema, third_party_admin)
  end

  context 'happy path' do
    specify { expect { validate! }.to_not raise_error }
  end

  describe 'required attributes (not nil)' do
    [
      :canonical_klass,
      :is_sync_update,
      :id,
      :version,
      :name,
      :system_code,
      :third_party_admin_type_id,
      :third_party_admin_type_name,
      :third_party_admin_type_system_code,
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
