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

  def name_and_profile_match?
    return true if Cecv.find_by(name: name)&.fei_number == self.fei_number

    self.errors.add(:base, "No matching CECV database entry found.")
    false
  end



  def create_verification
    Verification.create!(
      supplier: self,
      registration_completion: true
    )
  end

  def license_check
    self.verifications.first.update(valid_registration_license: true)
  end

end
