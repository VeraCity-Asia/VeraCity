class Certification < ApplicationRecord
  has_and_belongs_to_many :products
  validates :number, :validity, :category, :listing_number, :code, :authority, presence: true
  #selection
end
