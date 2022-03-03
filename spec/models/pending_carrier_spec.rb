# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::PendingCarrier do
  NULLEABLE_ATTRIBUTES = [
    :blue_ink_required,
    :eligibility_source_id,
    :enrollment_required,
    :enrollment_mandatory_fields,
    :enrollment_signature_required,
    :message,
    :pass_through_fee,
    :secondary_supported
  ].freeze

  let(:canonical_klass) { 'MasterControl::Models::PendingCarrier' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:aasm_state) { Faker::Company.name }
  let(:blue_ink_required) { Faker::Boolean.boolean }
  let(:carrier_identifier) { Faker::Company.name }
  let(:eligibility_source_id) { SecureRandom.uuid }
  let(:enrollment_required) { Faker::Boolean.boolean }
  let(:enrollment_mandatory_fields) { Faker::Company.name }
  let(:enrollment_signature_required) { Faker::Boolean.boolean }
  let(:is_resolved) { Faker::Boolean.boolean }
  let(:message) { Faker::Company.name }
  let(:name) { Faker::Company.name }
  let(:pass_through_fee) { 0.01 }
  let(:secondary_supported) { Faker::Boolean.boolean }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:pending_carrier) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      aasm_state: aasm_state,
      blue_ink_required: blue_ink_required,
      carrier_identifier: carrier_identifier,
      eligibility_source_id: eligibility_source_id,
      enrollment_required: enrollment_required,
      enrollment_mandatory_fields: enrollment_mandatory_fields,
      enrollment_signature_required: enrollment_signature_required,
      is_resolved: is_resolved,
      message: message,
      name: name,
      pass_through_fee: pass_through_fee,
      secondary_supported: secondary_supported,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::PendingCarrier.json_schema, pending_carrier)
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
      :aasm_state,
      :version,
      :name,
      :carrier_identifier,
      :is_resolved,
      :active,
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
