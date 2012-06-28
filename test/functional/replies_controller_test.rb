require 'test_helper'

class RepliesControllerTest < ActionController::TestCase
  setup do
    @message = messages(:one)
    @message.save
    @user = users(:tyler)
    session[:user_id] = @user
  end
  
  test "should get create" do
    post :create, {:message_id => @message, :reply => {:body => "this is a test reply!"} }
    assert_redirected_to message_path(@message)
  end

end
