class JoinProductsOffers < ActiveRecord::Migration[6.0]
  def change
    create_join_table :products, :offers
  end
end
