# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::TreatmentPlanService do
  NULLEABLE_ATTRIBUTES = [].freeze

  let(:canonical_klass) { 'MasterControl::Models::TreatmentPlanService' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:customer_id) { SecureRandom.uuid }
  let(:treatment_plan_id) { SecureRandom.uuid }
  let(:customer_service_id) { SecureRandom.uuid }
  let(:proposed_service_total) { 220 }
  let(:proposed_services_per_week) { 220 }
  let(:current_approved_services_per_week) { 230 }
  let(:current_approved_services) { 230 }
  let(:total_approved_services_per_week) { 230 }
  let(:total_approved_services) { 230 }
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

  let(:treatment_plan_service) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      customer_id: customer_id,
      treatment_plan_id: treatment_plan_id,
      customer_service_id: customer_service_id,
      proposed_service_total: proposed_service_total,
      proposed_services_per_week: proposed_services_per_week,
      current_approved_services_per_week: current_approved_services_per_week,
      current_approved_services: current_approved_services,
      total_approved_services_per_week: total_approved_services_per_week,
      total_approved_services: total_approved_services,
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
    JSON::Validator.validate!(MasterControl::Models::TreatmentPlanService.json_schema, treatment_plan_service)
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
      :customer_id,
      :treatment_plan_id,
      :customer_service_id,
      :proposed_service_total,
      :proposed_services_per_week,
      :proposed_started_at,
      :estimated_end_at,
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
