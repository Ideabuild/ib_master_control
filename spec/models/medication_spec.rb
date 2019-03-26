# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::Medication do
  NULLEABLE_ATTRIBUTES = [].freeze

  let(:canonical_klass) { 'MasterControl::Models::Medication' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:name) { 'Billing' }
  let(:generic_name) { 'billing' }
  let(:brand_name) { 'billing' }
  let(:display_name) { 'Billing' }
  let(:route) { 'billing' }
  let(:dose_form) { 'billing' }
  let(:additional_dose_information) { 'billing' }
  let(:strength) { 'billing' }
  let(:search_terms) { 'billing' }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:diagnosis_code) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      name: name,
      generic_name: generic_name,
      brand_name: brand_name,
      display_name: display_name,
      route: route,
      dose_form: dose_form,
      additional_dose_information: additional_dose_information,
      strength: strength,
      search_terms: search_terms,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::Medication.json_schema, diagnosis_code)
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
      :generic_name,
      :brand_name,
      :display_name,
      :route,
      :dose_form,
      :additional_dose_information,
      :strength,
      :search_terms,
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
