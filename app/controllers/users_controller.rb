# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save!
    render :account
  end

  def show
    @user = User.find(params[:id])
    if @user == current_user
      render :account
    else
      render :show
    end
  end

  def edit; end

  def update
    current_user.update(user_params)
    render :account
  end

  def destroy
    current_user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user)
          .permit(:name, :email, :password, :password_confirmation)
  end
end
