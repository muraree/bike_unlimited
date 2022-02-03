require 'rails_helper'

RSpec.describe "Users", type: :request do

  before do
    user  = User.create!(email: "james@jj.com", password: "123456", username: "james")
    post auth_login_url(email: "james@jj.com", password: "123456", username: "james")
    @new_token = JSON.parse(@response.body)["token"]
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new User" do

        user_params = {params: {
          email: "test@gmail.com",
          password: 123456,
          username: "test"
        }}
        expect {
          post users_url(user_params)
        }.to change(User, :count).by(1)
      end
    end
  end

  describe "GET /index" do
    it "renders a successful response" do
      get users_url,as: :json, headers: {:Authorization => @new_token}
      expect(response).to be_successful
    end
  end

  describe "PUT /update" do
    context "with valid parameters" do
      it "update a  User" do
        user  = User.last
        patch user_url(_username: user.username), :params => { :username => "Rostyk" }, headers: {:Authorization => @new_token}
        user.reload
        expect(user.username).to eq("Rostyk")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested user" do
      user  = User.last
      expect {
        delete user_url(_username: user.username), headers: {:Authorization => @new_token}
      }.to change(User, :count).by(-1)
    end
  end
end
