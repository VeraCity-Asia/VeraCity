class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.integer :amount
      t.string :destination
      t.integer :price
      t.string :payment
      t.date :date
      t.boolean :approved
      t.date :approved_date
      t.references :user, null: false, foreign_key: true
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
