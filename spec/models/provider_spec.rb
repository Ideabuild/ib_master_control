# frozen_string_literal: true
require 'spec_helper'

RSpec.describe MasterControl::Models::Provider do
  NULLEABLE_ATTRIBUTES = [
                          :title
                          ].freeze

  let(:canonical_klass) { 'MasterControl::Models::Provider' }
  let(:version) { '1.0.0' }
  let(:customer_id) { SecureRandom.uuid }
  let(:id) { SecureRandom.uuid }
  let(:title) { 'Dr.' }
  let(:first_name) { Faker::Name.first_name }
  let(:last_name) { Faker::Name.last_name }
  let(:npi) { '01164749' }
  let(:created_at) { Time.now.to_s(:iso8601) }
  let(:updated_at) { Time.now.to_s(:iso8601) }

  let(:provider) do
    {
      canonical_klass: canonical_klass,
      version: version,
      customer_id: customer_id,
      id: id,
      title: title,
      first_name: first_name,
      last_name: last_name,
      npi: npi,
      created_at: created_at,
      updated_at: updated_at
    }
  end

  def validate!
    JSON::Validator.validate!(MasterControl::Models::Provider.json_schema, provider)
  end

  context 'happy path' do
    specify { expect { validate! }.to_not raise_error }
  end

  describe 'required attributes (not nil)' do
    [
      :canonical_klass,
      :id,
      :version,
      :first_name,
      :last_name,
      :npi,
      :created_at,
      :updated_at
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
