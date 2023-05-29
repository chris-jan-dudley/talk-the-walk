# frozen_string_literal: true

Rails.application.routes.draw do
  root 'questions#index'
  
  resources :questions do
    resources :answers
  end

  resources :users
end
