require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get create" do
    post :create, {email: "abc@sina.com", password: "123"}
    assert_redirected_to root_path, "could not create a new session unless the email and password is correct!"
  end
  
  test "should get errors" do
    post :create
    assert_equal "Email or password is wrong!", assigns(:errors)
  end

  test "should get destroy" do
    post :destroy
    assert_redirected_to login_path, "could not destroy a session!"
  end

end
