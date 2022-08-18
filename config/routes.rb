# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tweets, only: %i[index new create]

  get 'accounts/index', as: :accounts

  root to: 'tweets#index'

  namespace :auth, as: '' do
    get 'sign_up', to: 'registrations#new'
    post 'sign_up', to: 'registrations#create'

    get 'sign_in', to: 'sessions#new'
    post 'sign_in', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
  end
end
