# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::Customer do
  let(:canonical_klass) { 'MasterControl::Models::Customer' }
  let(:version) { '1.1.0' }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }
  let(:id) { SecureRandom.uuid }
  let(:name) { Faker::Company.name }
  let(:npi) { Faker::Lorem.sentence(3) }
  let(:active) { true }
  let(:customer_type_id) { SecureRandom.uuid }
  let(:owner_id) { SecureRandom.uuid }
  let(:customer_type_name) { 'Rehab' }

  let(:customer) do
    {
      canonical_klass: canonical_klass,
      version: version,
      created_at: created_at,
      updated_at: updated_at,
      id: id,
      name: name,
      npi: npi,
      owner_id: owner_id,
      active: active,
      customer_type_id: customer_type_id,
      customer_type_name: customer_type_name
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::Customer.json_schema, customer)
  end

  context 'happy path' do
    specify { expect { validate! }.to_not raise_error }
  end

  describe 'required attributes (not nil)' do
    [
      :canonical_klass,
      :version,
      :created_at,
      :updated_at,
      :id,
      :name,
      :npi,
      :owner_id,
      :active,
      :customer_type_id,
      :customer_type_name
    ].each do |attribute|
      context attribute do
        let(attribute) { nil }

        specify { expect { validate! }.to raise_error JSON::Schema::ValidationError }
      end
    end
  end

  context 'nullable attributes' do
    [].each do |attribute|
      context attribute do
        let(attribute) { nil }

        specify { expect { validate! }.to_not raise_error }
      end
    end
  end

  context 'empty array attributes' do
    [].each do |attribute|
      context attribute do
        let(attribute) { [] }

        specify { expect { validate! }.to_not raise_error }
      end
    end
  end

  context 'format validations' do
    [:created_at, :updated_at, :customer_type_id].each do |attribute|
      context attribute do
        let(attribute) { '' }

        specify { expect { validate! }.to raise_error JSON::Schema::ValidationError }
      end
    end
  end
end
