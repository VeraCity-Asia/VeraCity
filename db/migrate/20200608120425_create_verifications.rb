class CreateVerifications < ActiveRecord::Migration[6.0]
  def change
    create_table :verifications do |t|
      t.boolean :veracity_approved
      t.boolean :valid_registration_license
      t.boolean :registration_completion
      t.boolean :has_factory
      t.boolean :has_international_certification
      t.boolean :audit_completed
      t.string :owner_name
      t.boolean :has_production_capacity
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
