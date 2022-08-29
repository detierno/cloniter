# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tweets, only: %i[index new create]

  resources :followers, only: %i[create destroy]

  get 'accounts/index', as: :accounts

  get 'profile', to: 'profiles#edit'
  patch 'profile', to: 'profiles#update'

  get 'feeds/index', as: :feed

  root to: 'tweets#index'

  namespace :auth, as: '' do
    get 'sign_up', to: 'registrations#new'
    post 'sign_up', to: 'registrations#create'

    get 'sign_in', to: 'sessions#new'
    post 'sign_in', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
  end
end
