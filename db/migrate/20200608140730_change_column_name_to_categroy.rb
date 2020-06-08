class ChangeColumnNameToCategroy < ActiveRecord::Migration[6.0]
  def change
    rename_column :certifications, :type, :category
  end
end
