class ChangeCertificationFieldsToString < ActiveRecord::Migration[6.0]
  def change
    change_column :licenses, :number, :string
    change_column :certifications, :number, :string
    change_column :certifications, :listing_number, :string
  end
end
