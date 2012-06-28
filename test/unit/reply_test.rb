require 'test_helper'

class ReplyTest < ActiveSupport::TestCase
    test "should save reply" do
       user = User.create(name: "abcd@sina.com", password: "123", password_confirmation: "123") 
       reply = Reply.new(body: "this is a test reply.")
       reply.user = user
       assert reply.save
     end
    
    test "should get associated objects" do
      user_a = User.create(name: "a@sina.com", password: "123", password_confirmation: "123")
      user_b = User.create(name: "b@sina.com", password: "123", password_confirmation: "123")
      message = Message.new(body: "test def message")
      message.user = user_a
      message.save
      reply = Reply.new(body: "reply to the test message.");
      reply.user = user_b
      reply.message = message
      reply.save
      assert reply.message, "could not get the message that replied to."
      assert reply.user, "could not the get user of the reply"
    end
  
end
