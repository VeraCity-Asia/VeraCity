class Message < ApplicationRecord
  belongs_to :product
  validates :title, :content, presence: true
end
