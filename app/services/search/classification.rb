require 'csv'

class Classification < ActiveRecord::Base
  def self.call(query)
    filepath = "db/repository/product_code_classification.csv"
    csv_table = CSV.table(filepath, converters: :all)
    result = csv_table.find do |row|
      row.field(:devicename) == query
    end
  end
  
end