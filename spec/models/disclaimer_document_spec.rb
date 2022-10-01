# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::DisclaimerDocument do
  NULLEABLE_ATTRIBUTES = [].freeze

  let(:canonical_klass) { 'MasterControl::Models::DisclaimerDocument' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:content_type) { 'txt' }
  let(:disclaimer_id) { SecureRandom.uuid }
  let(:document_type_id) { SecureRandom.uuid }
  let(:original_filename) { 'patient' }
  let(:s3_bucket) { 'Billing' }
  let(:s3_object_key) { 'patient' }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:disclaimer_document) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      content_type: content_type,
      disclaimer_id: disclaimer_id,
      document_type_id: document_type_id,
      original_filename: original_filename,
      s3_bucket: s3_bucket,
      s3_object_key: s3_object_key,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::DisclaimerDocument.json_schema, disclaimer_document)
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
      :content_type,
      :disclaimer_id,
      :document_type_id,
      :original_filename,
      :s3_bucket,
      :s3_object_key,
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
