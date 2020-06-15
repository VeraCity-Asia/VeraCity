class RemoveAmountFromOffers < ActiveRecord::Migration[6.0]
  def change
    remove_column :offers, :amount
  end
end
