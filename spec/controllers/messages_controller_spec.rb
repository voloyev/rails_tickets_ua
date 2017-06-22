require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  before(:each) do
    user = User.create(name: 'test', email: 'test@test.com', password: '123456', password_confirmation: '123456')
    sign_in user
  end
  
  describe 'GET /messages/new' do
    it 'responds successfully with an HTTP 200 status code' do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
