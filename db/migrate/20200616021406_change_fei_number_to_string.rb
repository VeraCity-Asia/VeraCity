class ChangeFeiNumberToString < ActiveRecord::Migration[6.0]
  def change
    change_column :suppliers, :fei_number, :string
  end
end
