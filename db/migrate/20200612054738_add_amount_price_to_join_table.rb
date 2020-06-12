class AddAmountPriceToJoinTable < ActiveRecord::Migration[6.0]
  def change
    add_column :offers_products, :amount, :integer
    add_column :offers_products, :price, :integer
  end
end
