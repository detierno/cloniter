# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tweets, only: %i[index new create] do
    resources :likes, only: %i[create destroy], module: :tweets
  end

  resources :followers, only: %i[create destroy]

  get 'accounts', to: 'accounts#index', as: :accounts

  get 'profile', to: 'profiles#edit'
  patch 'profile', to: 'profiles#update'

  get 'feed', to: 'feeds#index', as: :feed

  root to: 'feeds#index'

  namespace :auth, as: '' do
    get 'sign_up', to: 'registrations#new'
    post 'sign_up', to: 'registrations#create'

    get 'sign_in', to: 'sessions#new'
    post 'sign_in', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
  end
end
