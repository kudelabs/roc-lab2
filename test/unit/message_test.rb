require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test "should not save message without userid" do
    message = Message.new(body: "test message")
    assert_raise(ActiveRecord::RecordInvalid) {
      assert message.save!, "could not save message without user id!"
    }
  end

  test "should not save message containing more than 140 characters" do
    user = User.create(email: "abcd@sina.com", password: "123", password_confirmation: "123")
    msg = "a" * 141
    message = Message.new(body: msg) 
    message.user = user
    assert_raise(ActiveRecord::RecordInvalid) {
      assert message.save!, "could not save message containing more than 140 characters!"
    }
  end
  
  test "should save message" do
    user = User.create(email: "abcd@sina.com", password: "123", password_confirmation: "123")
    message = Message.new(body: "this is a test message.")
    message.user = user
    assert message.save
  end
  
  test "should get associated objects" do
    user = User.create(email: "abcd@sina.com", password: "123", password_confirmation: "123")
    message = Message.new(body: "test message")
    message.user = user
    message.save
    assert message.user, "could not get the user of the message!"
    assert message.replies, "could not get the replies to the message!"
  end
  
end
