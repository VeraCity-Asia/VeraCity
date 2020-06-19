class ChangeColumnToStringPrice < ActiveRecord::Migration[6.0]
  def change
    change_column :offers, :price, :string
  end
end
