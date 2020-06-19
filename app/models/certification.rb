class Certification < ApplicationRecord
  #validation
  CATEGORY = ["CE", "FDA", "ISO"]
  has_and_belongs_to_many :products
  validate :end_after_start
  validates :number,:start_date, :expired_date, :category, :listing_number, :code, :authority, presence: true
  validates :category, inclusion: { in: CATEGORY }
  has_many_attached :photos

  def end_after_start
    return if expired_date.blank? || start_date.blank?

    if expired_date< start_date
      errors.add(:expired_date, "must be after the start date")
    end
  end
end
