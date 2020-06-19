class ChangeColumnToString < ActiveRecord::Migration[6.0]
  def change
    change_column :product_offers, :amount, :string
  end
end
