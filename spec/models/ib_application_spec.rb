# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::IbApplication do
  NULLEABLE_ATTRIBUTES = [].freeze

  let(:canonical_klass) { 'MasterControl::Models::IbApplication' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:name) { 'AMD Integrator' }
  let(:system_code) { 'AMD_INTEGRATOR' }
  let(:development_url) { 'AMD_INTEGRATOR' }
  let(:staging_url) { 'AMD_INTEGRATOR' }
  let(:training_url) { 'AMD_INTEGRATOR' }
  let(:demo_url) { 'AMD_INTEGRATOR' }
  let(:production_url) { 'AMD_INTEGRATOR' }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:ib_application) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      name: name,
      system_code: system_code,
      development_url: development_url,
      staging_url: staging_url,
      training_url: training_url,
      demo_url: demo_url,
      production_url: production_url,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::IbApplication.json_schema, ib_application)
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
      :system_code,
      :development_url,
      :staging_url,
      :training_url,
      :demo_url,
      :production_url,  
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
