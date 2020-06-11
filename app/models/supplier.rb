class Supplier < ApplicationRecord
  #validation

  DELIVERYTERM = ["FOB", "EXW", "FAS", "FCA", "CFR", "CPT", "CIF", "CIP", "DES", "DAF", "DEQ", "DDP", "DDU"]
  PAYMETTERM = ["T/T", "L/C", "D/P", "Western Union", "Moneygram"]

  belongs_to :user
  has_many :products, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :licenses, dependent: :destroy
  has_many :verifications, dependent: :destroy
  validates :delivery_terms, inclusion: { in: DELIVERYTERM }
  validates :payment_terms, inclusion: { in: PAYMETTERM}
end
