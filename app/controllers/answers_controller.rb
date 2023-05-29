# frozen_string_literal: true

class AnswersController < ApplicationController
    before_action :require_signin
    before_action :set_movie

    def new
        @question = Question.find(params[:question_id])
        @answer = Answer.new
    end

    def create 
        @answer.user = current_user
        if @answer.save
            redirect_to question_path(@question)
        else
            render :new
        end
    end
end
