class RemoveForeignKeyFromProduct < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :products, column: :certification_id
    remove_reference(:products, :certifications, index: true, foreign_key: true)
  end
end
