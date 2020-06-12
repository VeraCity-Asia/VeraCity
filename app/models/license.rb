class License < ApplicationRecord
  belongs_to :supplier
  validates :authority, :number, presence: true
  has_many_attached :photos
end
