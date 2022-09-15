# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::Disclaimer do
  NULLEABLE_ATTRIBUTES = [].freeze

  let(:canonical_klass) { 'MasterControl::Models::Disclaimer' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:content) { 'Billing' }
  let(:content_type) { 'Billing' }
  let(:disclaimer_category_id) { SecureRandom.uuid }
  let(:disclaimer_category_name) { 'Billing' }
  let(:disclaimer_category_system_code) { 'Billing' }
  let(:disclaimer_type_id) { SecureRandom.uuid }
  let(:document_name) { 'Billing' }
  let(:name) { 'Billing' }
  let(:order) { 10 }
  let(:original_filename) { 'billing' }
  let(:s3_object_key) { 'billing' }
  let(:s3_bucket) { 'billing' }
  let(:summary) { 'billing' }
  let(:system_code) { 'billing' }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:disclaimer) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      content: content,
      content_type: content_type,
      disclaimer_category_id: disclaimer_category_id,
      disclaimer_category_name: disclaimer_category_name,
      disclaimer_category_system_code: disclaimer_category_system_code,
      disclaimer_type_id: disclaimer_type_id,
      document_name: document_name,
      name: name,
      order: order,
      original_filename: original_filename,
      s3_object_key: s3_object_key,
      s3_bucket: s3_bucket,
      summary: summary,
      system_code: system_code,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::Disclaimer.json_schema, disclaimer)
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
      :content,
      :name,
      :disclaimer_category_id,
      :disclaimer_category_name,
      :disclaimer_category_system_code,
      :disclaimer_type_id,
      :name,
      :order,
      :summary,
      :system_code,
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
