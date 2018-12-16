# frozen_string_literal: true
module MasterControl
  module ErrorHandler
    def self.notify(ex, params = {})
      return unless defined? Airbrake

      Airbrake.notify_sync(ex, params)
    end
  end
end
