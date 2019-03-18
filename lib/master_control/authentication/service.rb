# frozen_string_literal: true
module MasterControl
  module Authentication
    class Service
      def initialize(secret)
        @secret = secret
      end

      def payload_for(token)
        payload = decode(token).first
        puts "-----------decoded payload: #{payload}"
        verify_expiration(payload['exp'])

        data = payload['data'].with_indifferent_access

        verify(data)
        transform(data)
      end

      private

      def decode(token)
        JWT.decode(token, @secret, true)
      rescue JWT::DecodeError, JWT::ExpiredSignature => ex
        notify(ex)

        raise Exceptions::AccessDeniedError, "JWT decode failed: #{ex.message}"
      end

      def verify_expiration(expiration)
        unless expiration.present?
          raise Exceptions::AccessDeniedError, 'JWT token must contain an expiration (:exp) but none found'
        end

        unless expiration < expiration_threshold
          message = 'JWT token contains an expiration with a value too far in the future. ' \
            "threshold: #{expiration_threshold} but was: #{expiration}"
          raise Exceptions::AccessDeniedError, message
        end
      end

      def expiration_threshold
        thresholds[environment].to_i
      end

      def environment
        MasterControl.configuration.environment.to_sym
      end

      def thresholds
        {
          production: 2.hours.from_now,
          staging: 23.hours.from_now,
          devstaging: 6.months.from_now,
          development: 6.months.from_now,
          test: 1.year.from_now
        }
      end

      def notify(exception)
        message = "JWT login failed: #{exception.message}"

        # TODO: Airbrake.notify(message)
        logger.warn(" >> #{message}")
      end

      def logger
        MasterControl.configuration.logger
      end

      def verify(payload)
        unless payload[:active]
          message = "User #{payload[:id]} is not active"
          raise Exceptions::AccessDeniedError, message
        end

        app = find_app_in(payload)

        if app.nil?
          message = "#{application_key} not found in applications for user #{payload[:id]}"
          raise Exceptions::AccessDeniedError, message
        end
      end

      def transform(payload)
        payload.merge(roles: find_app_in(payload)[:roles]).except(:applications)
      end

      def application_key
        MasterControl.configuration.application
      end

      def find_app_in(payload)
        payload[:applications].detect { |item| item[:key] == application_key }
      end
    end
  end
end
