# frozen_string_literal: true
module Dummy
  class ApplicationController < ActionController::API
    include ActionController::Helpers
    include MasterControl::Authentication::Controller

    protected

    def load_user_for_authentication(id)
      User.find_by(id: id)
    end
  end
end
