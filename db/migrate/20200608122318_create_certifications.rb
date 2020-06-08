class CreateCertifications < ActiveRecord::Migration[6.0]
  def change
    create_table :certifications do |t|
      t.integer :number
      t.date :validity
      t.string :type
      t.string :product
      t.integer :listing_number
      t.integer :code
      t.string :authority
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
