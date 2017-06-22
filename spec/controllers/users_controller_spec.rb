require 'rails_helper'

RSpec.describe UsersController do
  before(:each) do
    user = User.create(name: 'test', email: 'test@test.com', password: '123456', password_confirmation: '123456', admin: true)
    sign_in user
  end

  describe 'GET /users' do
    it 'redirects to root' do
      expect(:users).not_to be_nil
    end
  end
end
