require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { User.create(username: 'Sally') }

  describe 'GET /new' do
    it 'should be successful' do
      get new_user_path
      expect(response).to be_successful
    end
  end

  describe 'Post /create' do
    it 'should create a User' do
      expect { user }.to change { User.count }.by(1)
    end
  end
end
