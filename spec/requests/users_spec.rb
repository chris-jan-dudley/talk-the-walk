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
    it 'renders list of users' do
      get '/users'
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end

    it 'shows user information when not logged in' do
      get '/users/2'
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end

  describe 'GET /account' do
    it 'shows current users account information when logged in' do
      get '/account'
      expect(response).to have_http_status(200)
      expect(response).to render_template(:account)
    end

    it 'redirects to signup page if not logged in' do
      session = { user_id: nil }
      allow_any_instance_of(UsersController).to receive(:session).and_return(session)
      get '/account'
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(register_path)
    end
  end

  describe 'GET /register' do
    it 'registering a new user shows form' do
      get '/register', params: @user_params
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe 'GET /account/edit' do
    it 'renders editing template account when logged in' do
      get '/account/edit', params: @user_params
      expect(response).to have_http_status(200)
      expect(response).to render_template(:edit)
    end
  end

  describe 'DELETE /account' do
    it 'can delete account if logged in' do
      delete '/account'
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'GET /login' do
    it 'with valid user to show account' do
      session = { user_id: nil }
      allow_any_instance_of(UsersController).to receive(:session).and_return(session)
      get '/login', params: @login_params
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe 'GET /logout' do
    it 'when logged in destroys session' do
      get '/logout'
      expect(response).to have_http_status(303)
      expect(response).to redirect_to(root_path)
    end
  end
end
