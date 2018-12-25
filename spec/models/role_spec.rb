# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::Role do
  NULLEABLE_ATTRIBUTES = [
                          :resource_type,
                          :resource_id
  ].freeze

  let(:canonical_klass) { 'MasterControl::Models::Provider' }
  let(:version) { '1.0.0' }
  let(:id) { SecureRandom.uuid }
  let(:name) { 'sys_admin' }
  let(:display_name) { 'Sys Admin' }
  let(:resource_type) { 'User' }
  let(:resource_id) { SecureRandom.uuid }
  let(:is_client_selectable) { true }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:role) do
    {
      canonical_klass: canonical_klass,
      version: version,
      id: id,
      name: name,
      display_name: display_name,
      resource_type: resource_type,
      resource_id: resource_id,
      is_client_selectable: is_client_selectable,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::Role.json_schema, role)
  end

  context 'happy path' do
    specify { expect { validate! }.to_not raise_error }
  end

  describe 'required attributes (not nil)' do
    [
      :canonical_klass,
      :id,
      :version,
      :name,
      :display_name,
      :created_at,
      :updated_at,
      :updated_by_id
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
