require 'rails_helper'

RSpec.describe 'Questions', type: :request do
  describe 'GET /questions' do
    it 'have 200 status' do
      expect(get('/questions')).to
      have_http_status(200)
    end

    it 'have 200 status' do
      expect(get('/questions/1')).to
      have_http_status(200)
    end
  end

  describe 'POST /questions' do
    it 'have 200 status' do
      expect(post('/questions')).to
      have_http_status(200)
    end
  end

  describe 'PUT /questions' do
    it 'have 200 status' do
      expect(put('/questions/1')).to
      have_http_status(200)
    end
  end

  describe 'DELETE /questions' do
    it 'have 200 status' do
      expect(delete('/questions/1')).to
      have_http_status(200)
    end
  end
end
