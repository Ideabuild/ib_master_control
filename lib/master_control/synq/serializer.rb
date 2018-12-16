# frozen_string_literal: true
module MasterControl
  module Synq
    class Serializer
      class << self
        def serialize(object)
          validate!(object)

          serialized(object)
        end

        def deserialize(payload)
          ActiveSupport::JSON.decode(payload).with_indifferent_access
        end

        protected

        def canonical_klass(object)
          "MasterControl::Models::#{object.class.name.demodulize}".constantize
        end

        def validate!(object)
          JSON::Validator.validate!(json_schema(object), serialized(object), validate_schema: true)
        end

        def json_schema(object)
          canonical_klass(object).json_schema
        end

        def serializer(object)
          canonical_klass(object).new(object)
        end

        def serialized(object)
          serializer(object).to_json
        end
      end
    end
  end
end
