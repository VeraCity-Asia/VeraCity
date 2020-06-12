class Offer < ApplicationRecord
  #validation
  PAYMENT = ["Visa", "MasterCard", "Invoice", "Wire Transfer"]

  belongs_to :user
  belongs_to :supplier
  has_and_belongs_to_many :products
  validates :amount, :destination, :price, :payment, presence: true
  validates :payment, inclusion: { in: PAYMENT }

  def self.add(user, product)
    return if user.user_type == "supplier"

    offer = self.find_by(approved: nil, user: user, supplier: product.supplier)
  end
end
