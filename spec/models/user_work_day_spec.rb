# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::UserWorkDay do
  NULLEABLE_ATTRIBUTES = [
    :day_end_seconds,
    :day_start_seconds,
    :lunch_end_seconds,
    :lunch_start_seconds,
  ].freeze

  let(:canonical_klass) { 'MasterControl::Models::UserWorkDay' }
  let(:master_control_version) { '1.0.0' }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:day_end_seconds) { 1 }
  let(:day_index) { 0 }
  let(:day_start_seconds) { 0 }
  let(:is_work_day) { true }
  let(:lunch_end_seconds) { 0 }
  let(:lunch_start_seconds) { 0 }
  let(:user_id) { SecureRandom.uuid }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:user_role_configuration) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      version: version,
      id: id,
      day_end_seconds: day_end_seconds,
      day_index: day_index,
      day_end_seconds: day_end_seconds,
      day_start_seconds: day_start_seconds,
      is_work_day: is_work_day,
      lunch_end_seconds: lunch_end_seconds,
      lunch_start_seconds: lunch_start_seconds,
      user_id: user_id,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::UserWorkDay.json_schema, user_role_configuration)
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
      :day_index,
      :is_work_day,
      :user_id,
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
