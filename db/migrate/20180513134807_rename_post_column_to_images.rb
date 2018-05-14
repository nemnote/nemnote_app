class RenamePostColumnToImages < ActiveRecord::Migration[5.1]
  def change
    rename_column :images, :post, :image
  end
end
