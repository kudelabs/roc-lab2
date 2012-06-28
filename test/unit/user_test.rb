require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without email, password or password_confirmation" do
    user = User.new
    assert_raise(ActiveRecord::RecordInvalid) {
      assert user.save!, "could not save user without email, password or password_confirmation"
    }
  end
  
  test "should not save user when password not equal to password_confirmation" do
    user = User.new(email: "zhnhu@foxmail.com", password: "123", password_confirmation: "1234")
    assert_raise(ActiveRecord::RecordInvalid) {
      assert user.save!, "could not save user when the validate_confirmation fails"
    }
  end
  
  test "should not save user when email in the wrong format" do
    user = User.new(email: "asdfasdf", password: "123", password_confirmation: "123")
    assert_raise(ActiveRecord::RecordInvalid){
     assert user.save!, "could not save user when email in the wrong format"
    }
  end
  
  test "should save user" do 
    user = User.new(email: "zhnhu@foxmail.com", password: "123", password_confirmation: "123")
    assert user.save
  end
  
  test "should get authenticated " do
    user = User.new(email: "abcd@sina.com", password: "123", password_confirmation: "123")
    user.save
    assert User.authenticate("abcd@sina.com", "123"), "must get authenticated"
  end
  
  test "general usage" do
    user = User.new(email: "abcd@sina.com", password: "123", password_confirmation: "123")
    user.save
    assert_equal "abcd", user.name, "the user.name is incorrect!"
    assert user.messages, "could not get the user's messages!"
    assert user.replies, "could not get the user's replies!"
  end
  
  test "should not save the same user twice" do
    user_a = User.new(email: "abcd@sina.com", password: "123", password_confirmation: "123") 
    user_a.save
    user_b = User.new(email: "abcd@sina.com", password: "123", password_confirmation: "123")
    assert_raise(ActiveRecord::RecordInvalid) {
      assert user_b.save!, "could not save the same user twice!"
    }
  end
 
  
end
