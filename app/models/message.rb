class Message < ApplicationRecord
  belongs_to :product
  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  belongs_to :receiver, class_name: "User", foreign_key: :receiver_id
  #to do
  #validate that sender and receiver are not the same user
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 10 }

  scope :conversation, -> (user, product) { 
    where(["sender_id = ? or receiver_id = ? and product_id = ?",
      user.id, user.id, product.id
    ]).order(created_at: :asc)
  }
  scope :of_user, -> (user) {
    where(["sender_id = ? or receiver_id = ?",
      user.id, user.id
    ]).order(created_at: :asc)
  }

  def self.latest_messages_by_product(user)
    # messages where user = user
    latest_messages = Message.of_user(user).group_by(&:product_id).map do |rank, message_group|
      message_group.sort_by(&:created_at).last
    end
    latest_messages.sort_by(&:created_at).reverse
  end
end
