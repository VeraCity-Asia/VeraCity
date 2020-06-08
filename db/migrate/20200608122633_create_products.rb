class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :type
      t.integer :production_quantity
      t.integer :minimum_order_quantity
      t.references :supplier, null: false, foreign_key: true
      t.references :certification, null: false, foreign_key: true

      t.timestamps
    end
  end
end
