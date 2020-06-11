class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :messages_as_sender, source: :messages, foreign_key: :sender_id
  has_many :messages_as_receiver, source: :messages, foreign_key: :receiver_id
  has_many :offers, dependent: :destroy
  validates :name, :country, presence: true
  has_one :supplier
end
