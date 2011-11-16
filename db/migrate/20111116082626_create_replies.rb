class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :body
      t.references :message

      t.timestamps
    end
    add_index :replies, :message_id
  end
end
