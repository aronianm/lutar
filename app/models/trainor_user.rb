class TrainorUser < ApplicationRecord

  # realtions
  has_one :trainor
  has_one :user
end
