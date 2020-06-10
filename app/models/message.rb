class Message < ApplicationRecord
  belongs_to :product
  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  belongs_to :receiver, class_name: "User", foreign_key: :receiver_id
  #to do
  #validate that sender and receiver are not the same user
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 10 }
end
