class CreateLicenses < ActiveRecord::Migration[6.0]
  def change
    create_table :licenses do |t|
      t.string :authority
      t.integer :number
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
