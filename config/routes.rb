# frozen_string_literal: true

Rails.application.routes.draw do
  root 'questions#index'

  resources :questions do
    resources :answers, except: %i[index show]
  end

  resources :users

  get 'account', to: 'users#account'
  get 'register', to: 'users#new'
  put 'account', to: 'users#update'
  delete 'account', to: 'users#destroy'

  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
end
