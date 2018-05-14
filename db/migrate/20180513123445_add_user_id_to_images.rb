class AddUserIdToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :user_id, :integer
  end
  add_index :images, [:user_id, :created_at]
  add_foreign_key :images, :users
end
