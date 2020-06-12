class Verification < ApplicationRecord
  belongs_to :supplier
  has_many_attached :photos
end
