class Product < ApplicationRecord
  belongs_to :supplier
  has_and_belongs_to_many :offers
  has_and_belongs_to_many :certifications
  has_many :messages

  validates :name, :price, :category, :production_quantity, :minimum_order_quantity, presence: true

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
