class DropOffersProducts < ActiveRecord::Migration[6.0]
  def change
    drop_table :offers_products
  end
end
