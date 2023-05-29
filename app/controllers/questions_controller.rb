# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :require_signin, except: %i[index show]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def update
    @question = Question.find(params[:id])
    @question.user = current_user
    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.user == current_user
      @question.destroy
      redirect_to questions_path
    else
      redirect_to question_path(@question), notice: "You can't delete this question!"
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
