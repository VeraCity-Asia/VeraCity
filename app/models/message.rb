class Message < ApplicationRecord
  belongs_to :product
  belongs_to :sender, class_name:"User"
  belongs_to :receiver, class_name:"User"
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 10 }
end
