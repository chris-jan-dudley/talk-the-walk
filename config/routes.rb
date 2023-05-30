# frozen_string_literal: true

Rails.application.routes.draw do
  root 'questions#index'

  resources :answers
  post 'answers/:id', to: 'answers#destroy'

  resources :questions do
    resources :answers, except: %i[index show]
  end

  resources :users

  get 'account', to: 'users#account'
  get 'register', to: 'users#new'
  get 'account/edit', to: 'users#edit'
  delete 'account', to: 'users#destroy'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
