# frozen_string_literal: true
module Dummy
  class ExampleController < ApplicationController
    def index
      render plain: 'DUMMY'
    end
  end
end
