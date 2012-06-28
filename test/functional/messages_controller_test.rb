require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  setup do
    @user = users(:tyler)
    @message = messages(:one)
    @message.user = @user
    @message.save
    session[:user_id] = @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(@messages)
  end

  test "should create message" do
    assert_difference('Message.count') do
      post :create, message: { body: @message.body }
    end

    assert_redirected_to messages_path
  end

  test "should show message" do
    get :show, id: @message
    assert_response :success
  end

  test "should destroy message" do
    assert_difference('Message.count', -1) do
      delete :destroy, id: @message
    end

    assert_redirected_to messages_path
  end
end
