class CreateConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :conversations do |t|
      t.integer :user_id
      t.integer :recipient_id

      t.timestamps
    end
  end
end
