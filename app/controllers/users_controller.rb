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
    if @user.save
      session[:user_id] = @user.id
      redirect_to (session[:intended_url] || :account),
                  notice: "Welcome to Talk the Walk, #{@user.name}!"
      session[:intended_url] = nil
    else
      render :new, notice: 'There was a problem creating your account.'
    end
  end

  def show
    @user = User.find(params[:id])
    @questions = @user.questions
    if @user == current_user
      redirect_to account_path
    else
      render :show
    end
  end

  def account
    if current_user
      @user = current_user
      @questions = @user.questions
    else
      redirect_to register_path
    end
  end

  def edit
    if current_user
      @user = current_user
      @questions = @user.questions
    else
      redirect_to register_path
    end
  end

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
