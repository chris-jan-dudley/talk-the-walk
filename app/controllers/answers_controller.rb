# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :require_signin, except: %i[index show]
  before_action :set_question

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)
    @answer.user = current_user
    if @answer.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def edit; end

  def update
    @answer = @question.answers.new(answer_params)
    @answer.user = current_user
    if @answer.update(answer_params)
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    if @answer.user == current_user
      @answer.destroy
      redirect_to question_path(@question)
    else
      redirect_to question_path(@question), notice: "You can't delete this answer!"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

end
