class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :handle, :string
    add_column :users, :description, :string
  end
end
