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

    @session = { user_id: 1 }
    allow_any_instance_of(QuestionsController).to receive(:session).and_return(@session)
  end

  describe 'GET /questions' do
    it 'get question index have 200 status' do
      get '/questions'
      expect(response).to have_http_status(200)
    end

    it 'get specific question to have 200 status' do
      get '/questions/1'
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /questions' do
    it 'create new question to have 302 status' do
      post '/questions', params: @question_params
      expect(response).to have_http_status(302)
    end
  end

  describe 'PUT /questions' do
    it 'edit question to have 302 status' do
      put '/questions/1', params: @question_params
      expect(response).to have_http_status(302)
    end
  end

  describe 'DELETE /questions' do
    context 'when user is logged in' do
      it 'deleting to have 303 status' do
        delete '/questions/1'
        expect(response).to have_http_status(302)
      end
    end

    context 'when user is not logged in' do
      it 'deleting to have 302 status' do
        session = { user_id: nil }
        allow_any_instance_of(UsersController).to receive(:session).and_return(session)
        delete '/questions/1'
        expect(response).to have_http_status(302)
      end
    end
  end
end
