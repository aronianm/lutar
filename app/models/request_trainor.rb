class RequestTrainor < ApplicationRecord
  # realtions
  has_one :trainor, primary_key: :trainor_id, foreign_key: :id
  has_one :user, primary_key: :user_id
end
