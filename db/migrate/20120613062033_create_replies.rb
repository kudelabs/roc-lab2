class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :body
      t.references :message
      t.references :user

      t.timestamps
    end
    add_index :replies, :message_id
    add_index :replies, :user_id
  end
end
