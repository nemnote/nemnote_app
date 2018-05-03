class AddCategoryToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :category, :integer
  end
  add_index :notes, :category
end
