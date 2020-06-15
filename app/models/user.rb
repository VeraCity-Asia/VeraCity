class User < ApplicationRecord
  extend Enumerize

  enumerize :user_type, in: [:purchaser, :supplier], predicates: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :messages_as_sender, source: :messages, foreign_key: :sender_id
  has_many :messages_as_receiver, source: :messages, foreign_key: :receiver_id
  has_many :offers, dependent: :destroy
  validates :name, presence: true
  validates :user_type, presence: true
  has_one :supplier
  
  after_create :create_supplier
  
  private

  def create_supplier
    return unless self.supplier? # this is called a guard statement

    Supplier.create!(
      user: self
    )
    puts "#" * 50
    puts self.supplier
    puts "#" * 50
  end

end
