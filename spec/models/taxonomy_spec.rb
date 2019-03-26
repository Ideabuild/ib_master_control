# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::Taxonomy do
  NULLEABLE_ATTRIBUTES = [
    :definition,
    :notes
  ].freeze

  let(:canonical_klass) { 'MasterControl::Models::Taxonomy' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:taxonomy_code) { 'Code 12' }
  let(:taxonomy_type) { 'Simple' }
  let(:taxonomy_classification) { 'General' }
  let(:taxonomy_specialization) { 'Hindsight' }
  let(:definition) { "long definition" }
  let(:notes) { 'Some notes' }
  let(:search_terms) { 'terms here and there '}
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:taxonomy_object) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      taxonomy_code: taxonomy_code,
      taxonomy_type: taxonomy_type,
      taxonomy_classification: taxonomy_classification,
      taxonomy_specialization: taxonomy_specialization,
      definition: definition,
      notes: notes,
      search_terms: search_terms,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::Taxonomy.json_schema, taxonomy_object)
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
      :active,
      :taxonomy_code,
      :taxonomy_type,
      :taxonomy_classification,
      :taxonomy_specialization,
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
