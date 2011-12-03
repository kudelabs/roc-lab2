class AddUserToMessagesAndReplies < ActiveRecord::Migration
  def change
    add_column :messages, :user_id, :integer
    add_column :replies, :user_id, :integer
  end
end
