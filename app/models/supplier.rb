class Supplier < ApplicationRecord
  #validation
  
  DELIVERYTERM = ["FOB", "EXW", "FAS", "FCA", "CFR", "CPT", "CIF", "CIP", "DES", "DAF", "DEQ", "DDP", "DDU"]
  PAYMETTERM = ["T/T", "L/C", "D/P", "Western Union", "Moneygram"]

  belongs_to :user
  has_many :products, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :licenses, dependent: :destroy
  has_many :verifications, dependent: :destroy
  validates :delivery_terms, inclusion: { in: DELIVERYTERM, allow_blank: true }
  validates :payment_terms, inclusion: { in: PAYMETTERM, allow_blank: true }

  def information_complete?
    delivery_terms.present? && payment_terms.present? && fei_number.present?
  end

  def name_match?
    return Cecv.find_by(name: self.name).name == self.name
  end
  

  def fda_profile_match?
    result = Cecv.find_by(name: self.name)
    return result.fei_number == self.fei_number
  end
  

end
