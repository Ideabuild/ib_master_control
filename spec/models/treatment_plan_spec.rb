# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::TreatmentPlan do
  NULLEABLE_ATTRIBUTES = [
    :referring_provider_id,
    :treating_provider_id,
    :customer_service_line_id,
    :backup_service_line_id,
    :proposed_duration,
    :current_approved_duration,
    :total_approved_duration,
    :duration_qualifier_id,
    :proposed_started_at,
    :actual_started_at,
    :estimated_end_at,
    :actual_end_at,
    :review_documents_required_at,
    :initial_auhorization_at,
    :current_auhorization_at,
    :current_authorization_number,
    :current_auhorization_expires_at,
    :state_event
  ].freeze

  let(:canonical_klass) { 'MasterControl::Models::TreatmentPlan' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:intake_id) { SecureRandom.uuid }
  let(:customer_id) { SecureRandom.uuid }
  let(:patient_id) { SecureRandom.uuid }
  let(:facility_id) { SecureRandom.uuid }
  let(:referring_provider_id) { SecureRandom.uuid }
  let(:treating_provider_id) { SecureRandom.uuid }
  let(:customer_service_line_id) { SecureRandom.uuid }
  let(:backup_service_line_id) { SecureRandom.uuid }
  let(:proposed_duration) { 10 }
  let(:current_approved_duration) { 220 }
  let(:total_approved_duration) { 230 }
  let(:duration_qualifier_id) { SecureRandom.uuid }
  let(:proposed_started_at) { Time.now.to_s(:iso8601) }
  let(:actual_started_at) { Time.now.to_s(:iso8601) }
  let(:estimated_end_at) { Time.now.to_s(:iso8601) }
  let(:actual_end_at) { Time.now.to_s(:iso8601) }
  let(:review_documents_required_at) { Time.now.to_s(:iso8601) }
  let(:initial_auhorization_at) { Time.now.to_s(:iso8601) }
  let(:current_auhorization_at) { Time.now.to_s(:iso8601) }
  let(:current_authorization_number) { 'Billing' }
  let(:current_auhorization_expires_at) { Time.now.to_s(:iso8601) }
  let(:aasm_state) { 'Billing' }
  let(:has_state_event) { true }
  let(:state_event) { 'update_state!' }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:treatment_plan) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      intake_id: intake_id,
      customer_id: customer_id,
      patient_id: patient_id,
      facility_id: facility_id,
      referring_provider_id: referring_provider_id,
      treating_provider_id: treating_provider_id,
      customer_service_line_id: customer_service_line_id,
      backup_service_line_id: backup_service_line_id,
      proposed_duration: proposed_duration,
      current_approved_duration: current_approved_duration,
      total_approved_duration: total_approved_duration,
      duration_qualifier_id: duration_qualifier_id,
      proposed_started_at: proposed_started_at,
      actual_started_at: actual_started_at,
      estimated_end_at: estimated_end_at,
      actual_end_at: actual_end_at,
      review_documents_required_at: review_documents_required_at,
      initial_auhorization_at: initial_auhorization_at,
      current_auhorization_at: current_auhorization_at,
      current_authorization_number: current_authorization_number,
      current_auhorization_expires_at: current_auhorization_expires_at,
      aasm_state: aasm_state,
      has_state_event: has_state_event,
      state_event: state_event,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::TreatmentPlan.json_schema, treatment_plan)
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
      :intake_id,
      :customer_id,
      :patient_id,
      :facility_id,
      :aasm_state,
      :has_state_event,
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
