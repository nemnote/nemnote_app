class CreateNoteCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :note_categories do |t|
      t.integer :category_id
      t.integer :note_id

      t.timestamps
    end
    add_index :note_categories, :category_id
    add_index :note_categories, :note_id
  end
end
