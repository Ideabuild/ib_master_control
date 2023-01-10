# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::AppStateNotification do
  NULLEABLE_ATTRIBUTES = [
    :content_type,
    :document_type_id,
    :original_filename,
    :s3_bucket,
    :s3_object_key
  ].freeze

  let(:canonical_klass) { 'MasterControl::Models::AppStateNotification' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:app_model_id) { SecureRandom.uuid }
  let(:app_notification_id) { SecureRandom.uuid }
  let(:app_state_id) { SecureRandom.uuid }
  let(:content_type) { 'A Name' }
  let(:document_type_id) { SecureRandom.uuid }
  let(:has_model_attachment) { true }
  let(:has_attachment) { true }
  let(:name) { 'A Name' }
  let(:original_filename) { 'boogie.txt' }
  let(:roles) { [{ id: SecureRandom.uuid, name: 'Admin' }] }
  let(:system_code) { 'the_code' }
  let(:s3_bucket) { 'a_bucket' }
  let(:s3_object_key) { SecureRandom.uuid }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:app_state_notification) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      app_model_id: app_model_id,
      app_notification_id: app_notification_id,
      app_state_id: app_state_id,
      content_type: content_type,
      document_type_id: document_type_id,
      has_model_attachment: has_model_attachment,
      has_attachment: has_attachment,
      name: name,
      original_filename: original_filename,
      roles: roles,
      system_code: system_code,
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
    JSON::Validator.validate!(MasterControl::Models::AppStateNotification.json_schema, app_state_notification)
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
      :app_notification_id,
      :app_state_id,
      :has_model_attachment,
      :has_attachment,
      :name,
      :roles,
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
