# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Answers', type: :request do

  before do
    @answer_params = {
      answer: {
        body: 'test'
      }
    }

    @session = { user_id: 1 }
    allow_any_instance_of(AnswersController).to receive(:session).and_return(@session)
  end

  describe 'POST questions/answers' do
    it 'create an answer to have 302 status' do
      post '/questions/1/answers', params: @answer_params
      expect(response).to have_http_status(302)
    end
  end

  describe 'PUT questions/answers' do
    it 'edit an answer to have 302 status' do
      put '/questions/1/answers/1', params: @answer_params
      expect(response).to have_http_status(302)
    end
  end

  describe 'DELETE questions/answers' do
    it 'delete an answer to have 302 status' do
      delete '/questions/1/answers/1'
      expect(response).to have_http_status(302)
    end
  end
end
