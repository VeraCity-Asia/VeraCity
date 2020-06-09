class RemoveCertificationColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :certification_id, :integer
  end
end
