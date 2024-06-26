# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::ServiceLine do
  NULLEABLE_ATTRIBUTES = [].freeze

  let(:canonical_klass) { 'MasterControl::Models::ServiceLine' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:auth_follow_up_day_threshold) { 10 }
  let(:authorization_review_type_id) { SecureRandom.uuid }
  let(:clinical_assessment_type_id) { SecureRandom.uuid }
  let(:order) { 10 }
  let(:name) { 'Billing' }
  let(:system_code) { 'billing' }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:no_pa_documents) { [{ id: SecureRandom.uuid }] }
  let(:optional_documents) { [{ id: SecureRandom.uuid }] }
  let(:required_documents) { [{ id: SecureRandom.uuid }] }
  let(:ur_documents) { [{ id: SecureRandom.uuid }] }
  let(:services) { [{ id: SecureRandom.uuid, name: 'A service', system_code: 'a_service' }] }
  let(:active) { true }

  let(:service_line) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      version: version,
      id: id,
      name: name,
      order: order,
      system_code: system_code,
      authorization_review_type_id: authorization_review_type_id,
      auth_follow_up_day_threshold: auth_follow_up_day_threshold,
      clinical_assessment_type_id: clinical_assessment_type_id,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      no_pa_documents: no_pa_documents,
      optional_documents: optional_documents,
      required_documents: required_documents,
      ur_documents: ur_documents,
      services: services,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::ServiceLine.json_schema, service_line)
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
      :authorization_review_type_id,
      :auth_follow_up_day_threshold,
      :name,
      :order,
      :system_code,
      :clinical_assessment_type_id,
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
