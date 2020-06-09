class License < ApplicationRecord
  belongs_to :supplier
  validates :authority, :number, presence: true
end
