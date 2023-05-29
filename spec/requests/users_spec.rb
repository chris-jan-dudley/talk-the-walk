# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before do
    @user_params = {
      user: {
        name: 'test',
        email: 'test@walks.com',
        password: '123456',
        password_confirmation: '123456'
      }
    }

    @login_params = {
      email: 'chris@walks.com',
      password: 'password'
    }

    @session = { user_id: 1 }
    allow_any_instance_of(UsersController).to receive(:session).and_return(@session)
  end

  describe 'GET /users' do
    it '/users have 200 status' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    it '/users/1 have 200 status' do
      get '/users/1'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /account' do
    it '/account have 200 status if logged in' do
      get '/account'
      expect(response).to have_http_status(200)
    end

    it '/account have 302 status if not logged in' do
      get '/account'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users' do
    it 'registering a new user has 200 status' do
      get '/register', params: @user_params
      expect(response).to have_http_status(200)
    end
  end

  describe 'PUT /account' do
    it 'editing to have 200 status' do
      put '/account', params: @user_params
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE /account' do
    it 'deleting user to have 200 status' do
      delete '/account'
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /login' do
    it 'logging in to have 302 status' do
      get '/login', params: @login_params
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE /logout' do
    it 'logging out to have 303 status' do
      delete '/logout'
      expect(response).to have_http_status(303)
    end
  end
end
