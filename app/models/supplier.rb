class Supplier < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :offers
  has_many :licenses
  has_many :verifications
end
