class Product < ApplicationRecord
  # valdation
  CATEGORY = ["Mask","thermometer","Bandage"]
  belongs_to :supplier
  has_and_belongs_to_many :offers, dependent: :destroy
  has_and_belongs_to_many :certifications, dependent: :destroy
  has_many :messages, dependent: :destroy
  accepts_nested_attributes_for :certifications

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

  pg_search_scope :filter_search,
    against: [:category, :minimum_order_quantity],
  associated_against: {
    certifications: [:category]
  },
  using: {
    tsearch: { prefix: true}
  }
end
