class AddSupplierFeiColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :suppliers, :fei_number, :integer
  end
end
