# frozen_string_literal: true
Rails.application.routes.draw do
  get '/dummy', controller: 'dummy/example', action: :index
end
