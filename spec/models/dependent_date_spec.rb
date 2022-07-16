# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::DependentDate do
  NULLEABLE_ATTRIBUTES = [].freeze

  let(:canonical_klass) { 'MasterControl::Models::DependentDate' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:app_model_id) { SecureRandom.uuid }
  let(:customer_app_state_id) { SecureRandom.uuid }
  let(:customer_id) { SecureRandom.uuid }
  let(:days_offset) { 20 }
  let(:dependent_date_column_id) { SecureRandom.uuid }
  let(:is_dependent_date_in_future) { true }
  let(:name) { 'A Name' }
  let(:reference_date_column_id) { SecureRandom.uuid }
  let(:system_code) { 'the_code' }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:dependent_date) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      app_model_id: app_model_id,
      customer_app_state_id: customer_app_state_id,
      customer_id: customer_id,
      days_offset: days_offset,
      dependent_date_column_id: dependent_date_column_id,
      is_dependent_date_in_future: is_dependent_date_in_future,
      name: name,
      reference_date_column_id: reference_date_column_id,
      system_code: system_code,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::DependentDate.json_schema, dependent_date)
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
      :app_model_id,
      :customer_app_state_id,
      :customer_id,
      :days_offset,
      :dependent_date_column_id,
      :is_dependent_date_in_future,
      :name,
      :reference_date_column_id,
      :system_code,
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