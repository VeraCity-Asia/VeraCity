class ChangeVerificationsColumnsAround < ActiveRecord::Migration[6.0]
  def change
    remove_column :verifications, :has_factory, :boolean
    remove_column :verifications, :has_international_certification, :boolean
    remove_column :verifications, :audit_completed, :boolean
    remove_column :verifications, :owner_name, :string
    remove_column :verifications, :has_production_capacity, :boolean

    change_column :verifications, :veracity_approved, :boolean, :default => false
    change_column :verifications, :valid_registration_license, :boolean, :default => false
    change_column :verifications, :registration_completion, :boolean, :default => false

  end
end
