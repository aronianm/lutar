class User < ApplicationRecord
  has_person_name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # realtions
  has_one :trainor_user
  has_one :trainor, through: :trainor_user

  has_many :request_trainors
  has_many :requested_trainors, through: :request_trainors



  def name 
    "#{self.fname} #{self.lname}"
  end
end
