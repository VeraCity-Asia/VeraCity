class RemoveDateFromOffers < ActiveRecord::Migration[6.0]
  def change
    remove_column :offers, :date
  end
end
