class Cecv < ApplicationRecord
  acts_as_copy_target

  validates_uniqueness_of :fei_number
end
