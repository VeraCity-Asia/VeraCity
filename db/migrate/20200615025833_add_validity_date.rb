class AddValidityDate < ActiveRecord::Migration[6.0]
  def change
    add_column :certifications, :start_date, :date
    add_column :certifications, :expired_date, :date
    add_column :licenses, :start_date, :date
    add_column :licenses, :expired_date, :date
  end
end
