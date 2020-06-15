class DeleteValidity < ActiveRecord::Migration[6.0]
  def change
    remove_column :certifications, :validity
  end
end
