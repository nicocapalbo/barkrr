class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.integer :followed_id
      t.integer :follower_id

      t.timestamps
    end

    add_index :followings, :follower_id
    add_index :followings, :followed_id
    add_index :followings, [:followed_id, :follower_id], unique: true
  end
end
