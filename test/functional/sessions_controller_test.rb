require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get create" do
    user = User.create(name: "abc@sina.com", password: "123", password_confirmation: "123")
    post :create, {name: "abc@sina.com", password: "123"}
    assert_redirected_to root_path, "could not create a new session unless the name and password is correct!"
  end
  
  test "should get errors" do
    post :create
    assert_equal "Wrong user or password.", assigns(:errors)
  end

  test "should get destroy" do
    post :destroy
    assert_redirected_to new_session_path, "could not destroy a session!"
  end
  

end
