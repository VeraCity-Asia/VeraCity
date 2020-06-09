class AddKindToLicenses < ActiveRecord::Migration[6.0]
  def change
    add_column :licenses, :kind, :string
  end
end
