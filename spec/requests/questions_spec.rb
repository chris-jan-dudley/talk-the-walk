# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Questions', type: :request do
  before do
    @question_params = {
      question: {
        title: 'test',
        body: 'test'
      }
    }

    @question = Question.find(1)

    @session = { user_id: 1 }
    allow_any_instance_of(QuestionsController).to receive(:session).and_return(@session)
  end

  describe 'GET /questions' do
    it 'render question index' do
      get '/questions'
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end

    it 'render question details' do
      get '/questions/1'
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end

  describe 'POST /questions' do
    it 'when logged in to redirect to new qusetion' do
      post '/questions', params: @question_params
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(question_path(Question.last))
    end

    it 'when logged out to redirect to login' do
      session = { user_id: nil }
      allow_any_instance_of(QuestionsController).to receive(:session).and_return(session)
      post '/questions', params: @question_params
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(login_path)
    end
  end

  describe 'PUT /questions' do
    it 'when logged in to correct user' do
      put '/questions/1', params: @question_params
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(question_path(@question))
    end

    it 'when logged in to wrong user redirects to question' do
      session = { user_id: 2 }
      allow_any_instance_of(QuestionsController).to receive(:session).and_return(session)
      put '/questions/1', params: @question_params
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(question_path(@question))
    end

    it 'when logged out to redirect to login' do
      session = { user_id: nil }
      allow_any_instance_of(QuestionsController).to receive(:session).and_return(session)
      post '/questions', params: @question_params
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(login_path)
    end
  end

  describe 'DELETE /questions' do
    it 'when logged in redirect to questions index' do
      delete '/questions/1'
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(questions_path)
    end

    it 'when logged in to wrong user redirects to question' do
      session = { user_id: 2 }
      allow_any_instance_of(QuestionsController).to receive(:session).and_return(session)
      put '/questions/1', params: @question_params
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(question_path(@question))
    end

    it 'when logged out to redirect to login' do
      session = { user_id: nil }
      allow_any_instance_of(QuestionsController).to receive(:session).and_return(session)
      delete '/questions/1'
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(login_path)
    end
  end
end
