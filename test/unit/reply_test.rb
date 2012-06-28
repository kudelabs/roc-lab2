require 'test_helper'

class ReplyTest < ActiveSupport::TestCase
  test "should not save reply without user id" do
    assert_raise(ActiveRecord::RecordInvalid) {
      reply = Reply.new(body: "abc") 
      assert reply.save!, "could not save reply without user id"
    }
  end
  
  test "should not save reply containing less than 1 char or more than 50 chars" do
    user = User.create(email: "abcd@sina.com", password: "123", password_confirmation: "123")
    assert_raise(ActiveRecord::RecordInvalid) {
      reply_less = Reply.new
      reply_less.user = user
      assert reply_less.save!, "could not save reply containing less than 1 character"
    }
    assert_raise(ActiveRecord::RecordInvalid) {
      rep = "a" * 51
      reply_more = Reply.new(body: rep)
      reply_more.user = user
      assert reply_more.save!, "count not save reply containing more than 50 characters"
    }
  end
  
  test "should save reply" do
    user = User.create(email: "abcd@sina.com", password: "123", password_confirmation: "123") 
    reply = Reply.new(body: "this is a test reply.")
    reply.user = user
    assert reply.save
  end
  
  test "should get associated objects" do
    user_a = User.create(email: "a@sina.com", password: "123", password_confirmation: "123")
    user_b = User.create(email: "b@sina.com", password: "123", password_confirmation: "123")
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
