class AddBuyToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :buy, :integer
  end
end
