class Offer < ApplicationRecord
  #validation
  PAYMENT = ["Visa", "MasterCard", "Invoice", "Wire Transfer"]

  belongs_to :user
  belongs_to :supplier
  has_many :product_offers, dependent: :destroy
  has_many :products, through: :product_offers

  validates :destination, :payment, presence: true
  validates :payment, inclusion: { in: PAYMENT }

  def self.add_product(user, product, amount, offer_attributes)
    return if user.supplier?
    offer = offer_for_product(user, product)
    offer.assign_attributes(offer_attributes)

    ActiveRecord::Base.transaction do
      offer.save!
      ProductOffer.create!(product: product, offer: offer, amount: amount.to_i)
      offer.calculate_price
    end
    return offer
  end

  def self.offer_for_product(user, product)
    offer = self.find_or_initialize_by(
      confirmed: false,
      user: user,
      supplier: product.supplier
    )
  end

  def calculate_price
    prices = product_offers.map { |po| po.product.price.to_i * po.amount.to_i }
    self.update(price: prices.sum)
  end
end
