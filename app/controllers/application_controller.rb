# frozen_string_literal: true

require 'byebug'

class ApplicationController < ActionController::Base
  private

  def beta_flag
    false
  end

  def require_signin
    return if current_user

    session[:intended_url] = request.url
    redirect_to login_path, alert: 'Please sign in first!'
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
  helper_method :beta_flag

  def current_user?(user)
    current_user == user
  end
end
