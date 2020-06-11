class Supplier < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :licenses, dependent: :destroy
  has_many :verifications, dependent: :destroy
end
