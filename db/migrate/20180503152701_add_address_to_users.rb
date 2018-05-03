class AddAddressToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :address, :string
  end
  add_index :users, :address
end
