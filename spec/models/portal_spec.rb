# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::Portal do
  NULLEABLE_ATTRIBUTES = [
  ].freeze

  let(:canonical_klass) { 'MasterControl::Models::Portal' }
  let(:master_control_version) { '1.0.0' }
  let(:is_sync_update) { true }
  let(:version) { 1 }
  let(:id) { SecureRandom.uuid }
  let(:admin_email) { Faker::Internet.email }
  let(:admin_name) { Faker::Internet.username }
  let(:customer_id) { SecureRandom.uuid }
  let(:name) { Faker::Types.rb_string }
  let(:portal_type_name) { Faker::Types.rb_string }
  let(:portal_type_system_code) { Faker::Types.rb_string }
  let(:password) { Faker::Internet.password }
  let(:url) { Faker::Internet.url }
  let(:username) { Faker::Internet.username }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:updated_by_id) { SecureRandom.uuid }
  let(:created_by_id) { SecureRandom.uuid }
  let(:active) { true }

  let(:portal) do
    {
      canonical_klass: canonical_klass,
      master_control_version: master_control_version,
      is_sync_update: is_sync_update,
      version: version,
      id: id,
      admin_email: admin_email,
      admin_name: admin_name,
      customer_id: customer_id,
      name: name,
      portal_type_name: portal_type_name,
      portal_type_system_code: portal_type_system_code,
      password: password,
      url: url,
      username: username,
      created_at: created_at,
      updated_at: updated_at,
      updated_by_id: updated_by_id,
      created_by_id: created_by_id,
      active: active
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::Portal.json_schema, portal)
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
      :admin_email,
      :admin_name,
      :customer_id,
      :name,
      :portal_type_name,
      :portal_type_system_code,
      :password,
      :url,
      :username,
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
