class AddTitleToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :title, :string
  end
  add_index :notes, :title
end
