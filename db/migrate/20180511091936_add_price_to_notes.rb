class AddPriceToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :price, :integer
  end
  add_index :notes, :price
end
