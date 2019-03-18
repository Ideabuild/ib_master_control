# frozen_string_literal: true
module MasterControl
  module Authentication
    module Controller
      extend ActiveSupport::Concern

      included do
        prepend_before_action :authenticate_user!

        # helper_method :current_user

        rescue_from MasterControl::Exceptions::AccessDeniedError, with: :response_for_access_denied
      end

      def current_user
        # TODO: enhance later to use session check ?
        @current_user
      end

      protected

      def authenticate_user!
        return true if current_user
        puts "----------------request.headers['Authorization']: #{request.headers['Authorization']}"
        puts "----------------request.headers['authorization']: #{request.headers['authorization']}"
        
        authenticate_user(request.headers['Authorization']) ||
          raise(MasterControl::Exceptions::AccessDeniedError)
      end

      def ensure_user(payload)
        user = load_user_for_authentication(payload[:id])

        raise MasterControl::Exceptions::AccessDeniedError if user.nil?

        user
      end

      def authenticate_user(authorization_header)
        return nil if authorization_header.blank?

        token = authorization_header.split(' ').last
        puts "-------------token: #{token}"
        payload = authentication_service.payload_for(token)
        puts "-------------payload: #{payload}"
        @current_user = ensure_user(payload)
      end

      def load_user_for_authentication(_id)
        raise NotImplementedError, 'Authentication Controller must know how to load its own users'
      end

      def authentication_service
        jwt_secret = MasterControl::Authentication.configuration.jwt_secret

        @authentication_service ||= MasterControl::Authentication::Service.new(jwt_secret)
      end

      def response_for_access_denied(ex)
        render json: { messages: [ex.message] }, status: 401
      end
    end
  end
end
