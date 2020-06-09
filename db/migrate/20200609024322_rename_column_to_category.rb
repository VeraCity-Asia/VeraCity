class RenameColumnToCategory < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :type, :category
  end
end
