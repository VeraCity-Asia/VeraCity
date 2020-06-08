class ChangeCodeDataType < ActiveRecord::Migration[6.0]
  def change
    change_column :certifications, :code, :string
  end
end
