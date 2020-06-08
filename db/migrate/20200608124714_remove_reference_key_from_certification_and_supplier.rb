class RemoveReferenceKeyFromCertificationAndSupplier < ActiveRecord::Migration[6.0]
  def change
    remove_column :certifications, :supplier_id, :integer
  end
end
