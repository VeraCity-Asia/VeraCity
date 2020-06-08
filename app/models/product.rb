class Product < ApplicationRecord
  belongs_to :supplier
  belongs_to :certification
  has_and_belongs_to_many :offers

end
