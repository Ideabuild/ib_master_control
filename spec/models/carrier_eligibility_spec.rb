# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::CarrierEligibility do
  NULLEABLE_ATTRIBUTES = [].freeze

  let(:canonical_klass) { 'MasterControl::Models::CarrierEligibility' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:eligibility_source_id) { SecureRandom.uuid }
  let(:carrier_id) { SecureRandom.uuid }
  let(:carrier_identifier) { 'blue' }
  let(:pass_through_fee) { 54.32 }
  let(:enrollment_required) { true }
  let(:enrollment_mandatory_fields) { 'some fields' }
  let(:enrollment_signature_required) { true }
  let(:secondary_supported) { true }
  let(:blue_ink_required) { true }
  let(:message) { 'a message' }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:carrier_eligibility) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      eligibility_source_id: eligibility_source_id,
      carrier_id: carrier_id,
      carrier_identifier: carrier_identifier,
      pass_through_fee: pass_through_fee,
      enrollment_required: enrollment_required,
      enrollment_mandatory_fields: enrollment_mandatory_fields,
      enrollment_signature_required: enrollment_signature_required,
      secondary_supported: secondary_supported,
      message: message,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::CarrierEligibility.json_schema, carrier_eligibility)
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
      :eligibility_source_id,
      :carrier_id,
      :carrier_identifier,
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
