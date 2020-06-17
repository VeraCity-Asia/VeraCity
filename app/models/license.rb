class License < ApplicationRecord
  belongs_to :supplier
  validates :authority, :number,:start_date, :expired_date, presence: true
  has_many_attached :photos

  def end_after_start
    return if expired_date.blank? || start_date.blank?

    if expired_date< start_date
      errors.add(:expired_date, "must be after the start date")
    end
  end
end
