class JoinProductsCertifications < ActiveRecord::Migration[6.0]
  def change
    create_join_table :products, :certifications
  end
end
