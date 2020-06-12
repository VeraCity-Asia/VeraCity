class Certification < ApplicationRecord
  #validation
  CATEGORY = ["CE", "FDA", "ISO"]
  has_and_belongs_to_many :products
  validates :number, :validity, :category, :listing_number, :code, :authority, presence: true
  validates :category, inclusion: { in: CATEGORY }
  has_many_attached :photos
end
