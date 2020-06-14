class AddAmoutColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :amount, :integer
  end
end
