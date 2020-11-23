require "test_helper"

describe UsersController do
  describe "login" do
    it "can log in an existing user" do
      expect{
        perform_login(users(:ada))
      }.wont_change "User.count"

      must_respond_with :redirect
    end

    it "can log in a new user" do
      new_user = User.new(uid: "123", username: "username123", provider: "github", email: "someuser@gmail.com")

      expect {
        perform_login(new_user)
      }.must_change "User.count", 1

      must_respond_with :redirect
    end

  end

  describe "destroy" do
    it "can logout an existing user" do
      # Arrange
      perform_login

      expect(session[:user_id]).wont_be_nil

      delete logout_path, params: {}

      expect(session[:user_id]).must_be_nil
      must_redirect_to root_path
    end

    it "guest users on that route" do
    end
  end

end