# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Answers', type: :request do
  before do
    @question = Question.find(1)

    @answer_params = {
      answer: {
        body: 'test'
      }
    }

    @session = { user_id: 1 }
    allow_any_instance_of(AnswersController).to receive(:session).and_return(@session)
  end

  describe 'POST questions/answers' do
    it 'when logged in to redirect to question' do
      post '/questions/1/answers', params: @answer_params
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(question_path(@question))
    end

    it 'when logged out to redirect to login' do
      session = { user_id: nil }
      allow_any_instance_of(AnswersController).to receive(:session).and_return(session)
      post '/questions/1/answers', params: @answer_params
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(login_path)
    end
  end

  describe 'PUT questions/answers' do
    it 'when logged in to redirect to question' do
      put '/questions/1/answers/1', params: @answer_params
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(question_path(@question))
    end

    it 'when logged in to wrong user redirect to question' do
      session = { user_id: 2 }
      allow_any_instance_of(AnswersController).to receive(:session).and_return(session)
      put '/questions/1/answers/1', params: @answer_params
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(question_path(@question))
    end

    it 'when logged out to redirect to login' do
      session = { user_id: nil }
      allow_any_instance_of(AnswersController).to receive(:session).and_return(session)
      put '/questions/1/answers/1', params: @answer_params
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(login_path)
    end
  end

  describe 'DELETE questions/answers' do
    it 'when logged in to redirect to question' do
      delete '/questions/1/answers/1'
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(question_path(@question))
    end

    it 'when logged in to wrong user redirect to question' do
      session = { user_id: 2 }
      allow_any_instance_of(AnswersController).to receive(:session).and_return(session)
      delete '/questions/1/answers/1'
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(question_path(@question))
    end

    it 'when logged out to redirect to login' do
      session = { user_id: nil }
      allow_any_instance_of(AnswersController).to receive(:session).and_return(session)
      delete '/questions/1/answers/1'
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(login_path)
    end
  end
end
