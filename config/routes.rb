# frozen_string_literal: true

Rails.application.routes.draw do
  resources :videos, only: %i[index new create]
  root to: 'videos#index'
end
