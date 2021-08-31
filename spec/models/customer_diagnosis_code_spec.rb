# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::CustomerDiagnosisCode do
  NULLEABLE_ATTRIBUTES = [].freeze

  let(:canonical_klass) { 'MasterControl::Models::CustomerDiagnosisCode' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:diagnosis_code_id) { SecureRandom.uuid }
  let(:customer_id) { SecureRandom.uuid }
  let(:name) { 'Billing' }
  let(:code) { 'billing' }
  let(:codeset) { 'billing' }
  let(:search_terms) { 'billing' }
  let(:is_on_verification_form) { true }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:customer_diagnosis_code) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      diagnosis_code_id: diagnosis_code_id,
      customer_id: customer_id,
      name: name,
      code: code,
      codeset: codeset,
      search_terms: search_terms,
      is_on_verification_form: is_on_verification_form,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::CustomerDiagnosisCode.json_schema, customer_diagnosis_code)
  end

  context 'happy path' do
    specify { expect { validate! }.to_not raise_error }
  end

  describe 'required attributes (not nil)' do
    [
      :canonical_klass,
      :id,
      :diagnosis_code_id,
      :customer_id,
      :master_control_version,
      :is_sync_update,
      :version,
      :name,
      :code,
      :codeset,
      :search_terms,
      :is_on_verification_form,
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
