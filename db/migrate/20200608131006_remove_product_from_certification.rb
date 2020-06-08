class RemoveProductFromCertification < ActiveRecord::Migration[6.0]
  def change
    remove_column :certifications, :product, :string
  end
end
