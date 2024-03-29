# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::CustomerServiceLine do
  NULLEABLE_ATTRIBUTES = [].freeze

  let(:canonical_klass) { 'MasterControl::Models::CustomerServiceLine' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:auth_follow_up_day_threshold) { 10 }
  let(:authorization_review_type_id) { SecureRandom.uuid }
  let(:clinical_assessment_type_id) { SecureRandom.uuid }
  let(:customer_id) { SecureRandom.uuid }
  let(:is_on_verification_form) { true }
  let(:name) { 'Billing' }
  let(:optional_documents) { [{ id: SecureRandom.uuid }] }
  let(:order) { 10 }
  let(:requires_accreditation) { true }
  let(:required_documents) { [{ id: SecureRandom.uuid }] }
  let(:service_line_id) { SecureRandom.uuid }
  let(:system_code) { 'billing' }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:customer_services) { [{ id: SecureRandom.uuid, name: 'A service', system_code: 'a_service' }] }
  let(:active) { true }

  let(:customer_service_line) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      auth_follow_up_day_threshold: auth_follow_up_day_threshold,
      authorization_review_type_id: authorization_review_type_id,
      customer_id: customer_id,
      clinical_assessment_type_id: clinical_assessment_type_id,
      is_on_verification_form: is_on_verification_form,
      name: name,
      optional_documents: optional_documents,
      order: order,
      required_documents: required_documents,
      requires_accreditation: requires_accreditation,
      service_line_id: service_line_id,
      system_code: system_code,
      customer_services: customer_services,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::CustomerServiceLine.json_schema, customer_service_line)
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
      :authorization_review_type_id,
      :auth_follow_up_day_threshold,
      :customer_id,
      :is_on_verification_form,
      :name,
      :order,
      :requires_accreditation,
      :service_line_id,
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
