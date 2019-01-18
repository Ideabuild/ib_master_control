# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::TaxonomiesInsuranceServiceType do
  NULLEABLE_ATTRIBUTES = [
  ].freeze

  let(:canonical_klass) { 'MasterControl::Models::TaxonomiesInsuranceServiceType' }
  let(:master_control_version) { '1.0.0' }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:taxonomy_id) { SecureRandom.uuid }
  let(:insurance_service_type_id) { SecureRandom.uuid }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:taxonomies_insurance_service_type_object) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      version: version,
      id: id,
      taxonomy_id: taxonomy_id,
      insurance_service_type_id: insurance_service_type_id,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::TaxonomiesInsuranceServiceType.json_schema, taxonomies_insurance_service_type_object)
  end

  context 'happy path' do
    specify { expect { validate! }.to_not raise_error }
  end

  describe 'required attributes (not nil)' do
    [
      :canonical_klass,
      :id,
      :master_control_version,
      :version,
      :active,
      :taxonomy_id,
      :insurance_service_type_id,
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
