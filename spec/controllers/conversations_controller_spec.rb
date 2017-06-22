require 'rails_helper'

RSpec.describe ConversationsController, type: :controller do
  before(:each) do
    user = User.create(name: 'test', email: 'test@test.com', password: '123456', password_confirmation: '123456')
    sign_in user
  end
  
  describe 'GET /' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
  
  describe 'GET /new' do
    it 'render template new' do
      get :new
      expect(response).to_not render_template(:new)
    end
  end
end
