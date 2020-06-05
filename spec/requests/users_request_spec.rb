require 'rails_helper'

RSpec.describe "Users", type: :request do
let(:user) {User.create(username: "Sally")}
  let(:event1) {Event.create(name: "Sample Event", location: "sample Location", start_date: '2020-06-03 21:05:42', creator: user)}

  describe "GET /new" do
    it "should be successful" do
      get new_user_path
      expect(response).to be_successful
    end
  end

  describe "Post /create" do
    it "should create a User" do
      expect {user}.to change {User.count}.by(1)
    end
  end
end
