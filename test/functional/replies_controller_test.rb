require  'test_helper'

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
    assert_nil flash[:notice]
  end
  
  test "should get error" do
    post :create, {:message_id => @message}
    assert_equal "Couldn't save reply, try again", flash[:notice]
  end
  
end
