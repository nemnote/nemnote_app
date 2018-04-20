class RemoveImageToNotes < ActiveRecord::Migration[5.1]
  def change
    remove_column :notes, :image, :string
  end
end
