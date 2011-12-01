class AddUserToMessagesAndReplies < ActiveRecord::Migration
  def change
    add_column :messages, :user_id, :reference
    add_column :replies, :user_id, :reference
  end
end
