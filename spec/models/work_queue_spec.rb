# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::WorkQueue do
  NULLEABLE_ATTRIBUTES = [].freeze

  let(:canonical_klass) { 'MasterControl::Models::WorkQueue' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:work_group_id) { SecureRandom.uuid }
  let(:customer_id) { SecureRandom.uuid }
  let(:name) { 'A Name' }
  let(:system_code) { 'the_code' }
  let(:is_group_by_queue) { true }
  let(:group_by_model_association_id) { SecureRandom.uuid }
  let(:group_by_column_id) { SecureRandom.uuid }
  let(:order_by_type_id) { SecureRandom.uuid }
  let(:order_by_model_association_id) { SecureRandom.uuid }
  let(:order_by_column_id) { SecureRandom.uuid }
  let(:order_by_direction) { 'the_code' }
  let(:priority_level) { 50 }
  let(:users) { [{ id: SecureRandom.uuid }] }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:work_queue) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      work_group_id: work_group_id,
      customer_id: customer_id,
      name: name,
      system_code: system_code,
      is_group_by_queue: is_group_by_queue,
      group_by_model_association_id: group_by_model_association_id,
      group_by_column_id: group_by_column_id,
      order_by_type_id: order_by_type_id,
      order_by_model_association_id: order_by_model_association_id,
      order_by_column_id: order_by_column_id,
      order_by_direction: order_by_direction,
      priority_level: priority_level,
      users: users,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::WorkQueue.json_schema, work_queue)
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
      :name,
      :system_code,
      :work_group_id,
      :customer_id,
      :is_group_by_queue,
      :order_by_type_id,
      :order_by_direction,
      :priority_level,
      :users,
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
