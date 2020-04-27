# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :videos, only: %i[index show new create] do
    collection do
      get :yours
      get :grid_view
    end
    resources :comments, only: :create
  end
  get 'share', to: 'videos#new'

  root to: 'videos#index'
end
