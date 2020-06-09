class AddIndustryDeliveryPaymentPortWhitelistedEstablishedToSuppliers < ActiveRecord::Migration[6.0]
  def change
    add_column :suppliers, :industry, :string
    add_column :suppliers, :delivery_terms, :string
    add_column :suppliers, :payment_terms, :string
    add_column :suppliers, :nearest_port, :string
    
    add_column :suppliers, :whitelisted, :boolean
    
    add_column :suppliers, :established, :date
  end
end
