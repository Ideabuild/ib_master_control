# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::ThirdPartyAdminAgent do
  NULLEABLE_ATTRIBUTES = [].freeze

  let(:canonical_klass) { 'MasterControl::Models::ThirdPartyAdminAgent' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:third_party_admin_id) { SecureRandom.uuid }
  let(:first_name) { 'Billing' }
  let(:middle_name) { 'billing' }
  let(:last_name) { 'billing' }
  let(:email) { 'Patient' }
  let(:phone) { 'patient' }
  let(:fax) { 'patient' }
  let(:url) { 'patient' }
  let(:s3_object_key) { 'patient' }
  let(:document_name) { 'patient' }
  let(:document_type_name) { 'patient' }
  let(:document_type_system_code) { 'patient' }
  let(:notes) { 'patient' }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:third_party_admin_agent) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      third_party_admin_id: third_party_admin_id,
      first_name: first_name,
      middle_name: middle_name,
      last_name: last_name,
      email: email,
      phone: phone,
      fax: fax,
      url: url,
      s3_object_key: s3_object_key,
      document_name: document_name,
      document_type_name: document_type_name,
      document_type_system_code: document_type_system_code,
      notes: notes,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::ThirdPartyAdminAgent.json_schema, third_party_admin_agent)
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
      :active,
      :third_party_admin_id,
      :first_name,
      :last_name,
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
