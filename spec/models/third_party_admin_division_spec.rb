# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::ThirdPartyAdminDivision do
  NULLEABLE_ATTRIBUTES = [
    :email,
    :fax,
    :phone,
    :url
  ].freeze

  let(:canonical_klass) { 'MasterControl::Models::ThirdPartyAdmin' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:aasm_state) { 'active' }
  let(:customer_id) { SecureRandom.uuid }
  let(:customer_app_state_id) { SecureRandom.uuid }
  let(:email) { 'Patient' }
  let(:fax) { 'patient' }
  let(:name) { 'Billing' }
  let(:phone) { 'patient' }
  let(:search_terms) { 'home depot' }
  let(:system_code) { 'billing' }
  let(:third_party_admin_id) { SecureRandom.uuid }
  let(:url) { 'patient' }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:third_party_admin_division) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      aasm_state: aasm_state,
      customer_id: customer_id,
      customer_app_state_id: customer_app_state_id,
      email: email,
      fax: fax,
      name: name,
      phone: phone,
      search_terms: search_terms,
      system_code: system_code,
      third_party_admin_id: third_party_admin_id,
      url: url,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::ThirdPartyAdminDivision.json_schema, third_party_admin_division)
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
      :aasm_state,
      :customer_id,
      :customer_app_state_id,
      :name,
      :search_terms,
      :system_code,
      :third_party_admin_id,
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
