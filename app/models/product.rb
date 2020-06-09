class Product < ApplicationRecord
  belongs_to :supplier
  has_and_belongs_to_many :offers
  has_and_belongs_to_many :certifications

  validates :name, :price, :category, :production_quantity, :minimum_order_quantity, presence: true

end
