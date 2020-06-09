class Message < ApplicationRecord
  belongs_to :product
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 10 }
end
