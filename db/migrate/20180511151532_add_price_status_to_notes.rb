class AddPriceStatusToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :price_status, :integer, limit: 5
  end
end
