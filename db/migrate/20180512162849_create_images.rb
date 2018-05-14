class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :post
      t.references :note, foreign_key: true

      t.timestamps
    end
    add_index :images, [:note_id, :created_at]
  end
end
