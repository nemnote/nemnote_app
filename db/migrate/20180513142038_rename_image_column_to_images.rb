class RenameImageColumnToImages < ActiveRecord::Migration[5.1]
  def change
    rename_column :images, :image, :picture
  end
end
