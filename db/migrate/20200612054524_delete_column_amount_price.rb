class DeleteColumnAmountPrice < ActiveRecord::Migration[6.0]
  def change
    remove_column :offers, :amount, :price
  end
end
