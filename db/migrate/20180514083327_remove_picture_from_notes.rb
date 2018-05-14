class RemovePictureFromNotes < ActiveRecord::Migration[5.1]
  def change
    remove_column :notes, :picture, :string
  end
end
