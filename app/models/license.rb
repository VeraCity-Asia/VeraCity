class License < ApplicationRecord
  belongs_to :supplier
  validates :authority, :number,:start_date, :expired_date, presence: true
  has_many_attached :photos
end
