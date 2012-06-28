require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new user" do
    get :new
    assert_response :success
  end
  
  test "should create user" do
    assert_difference("User.count") do
      post :create, user: {email: "zhnhu@foxmail.com", password: "123", password_confirmation: "123"}
    end
    assert_redirected_to root_path
  end
  
  test "should get errors" do
    post :create
    assert_not_nil assigns(:errors)
  end

end
