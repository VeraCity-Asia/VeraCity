class Product < ApplicationRecord
  # valdation
  CATEGORY = ["Mask","Thermometer","Bandage", "Isolation Gown","Medical First Aid Kit", "Face Shield", "Gloves"]
  belongs_to :supplier
  has_many :product_offers,  dependent: :destroy
  has_many :offers, through: :product_offers

  has_and_belongs_to_many :certifications, dependent: :destroy
  has_many :messages, dependent: :destroy
  accepts_nested_attributes_for :certifications
  has_many_attached :photos

  validates :name, :price, :production_quantity, :minimum_order_quantity, presence: true
  validates :category, inclusion: { in: CATEGORY }

  #selection variable

  $category = ["Mask","thermometer","Bandage"]
  $minimum_order_quantity = ["100","200","300"]
  $certification = ["CE", "FDA", "ISO"]
  #pgsearch
  #for general search
  include PgSearch::Model
  pg_search_scope :search_by_name_certification,
    against: [:name, :category],
  associated_against: {
    certifications: [:category, :number]
  },
  using: {
    tsearch: { prefix: true}
  }

end
