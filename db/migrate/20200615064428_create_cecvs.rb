class CreateCecvs < ActiveRecord::Migration[6.0]
  def change
    create_table :cecvs do |t|
      t.string :reg_key
      t.string :registration_number
      t.string :fei_number
      t.string :reg_status_id
      t.string :initial_importer_flag
      t.string :reg_expiry_date_year
      t.string :address_type_id
      t.string :name
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state_id
      t.string :iso_country_code
      t.string :zip_code
      t.string :postal_code

      # t.timestamps
    end
  end
end
