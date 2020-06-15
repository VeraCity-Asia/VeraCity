class AddConfirmedToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :confirmed, :boolean, default: false
  end
end
