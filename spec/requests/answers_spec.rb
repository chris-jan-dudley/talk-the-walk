require 'rails_helper'

RSpec.describe 'Answers', type: :request do
  describe 'GET questions/answers' do
    it 'have 200 status' do
      expect(get('/questions/1/answers')).to
      have_http_status(200)
    end
  end

  describe 'POST questions/answers' do
    it 'have 200 status' do
      expect(post('/questions/1/answers')).to
      have_http_status(200)
    end
  end

  describe 'PUT questions/answers' do
    it 'have 200 status' do
      expect(put('/questions/1/answers/1')).to
      have_http_status(200)
    end
  end

  describe 'DELETE questions/answers' do
    it 'have 200 status' do
      expect(delete('/questions/1/answers/1')).to
      have_http_status(200)
    end
  end
end
