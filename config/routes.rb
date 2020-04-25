# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :videos, only: %i[index new create]
  get 'share', to: 'videos#new'

  root to: 'videos#index'
end
