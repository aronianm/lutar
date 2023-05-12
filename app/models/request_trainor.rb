class RequestTrainor < ApplicationRecord
  # realtions
  has_one :trainor, primary_key: :trainor_id, foreign_key: :id
  belongs_to :user, foreign_key: :user_id
end
