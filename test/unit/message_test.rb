require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test "should save message" do
     user = User.create(name: "abcd@sina.com", password: "123", password_confirmation: "123")
     message = Message.new(body: "this is a test message.")
     message.user = user
     assert message.save
   end
   
  test "should get associated objects" do
      user = User.create(name: "abcd@sina.com", password: "123", password_confirmation: "123")
      message = Message.new(body: "test message")
      message.user = user
      message.save
      assert message.user, "could not get the user of the message!"
      assert message.replies, "could not get the replies to the message!"
    end
  
end
