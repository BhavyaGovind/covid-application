class User < ApplicationRecord
  has_many :user_symptoms
  has_many :symptoms, :through => :user_symptoms
  has_secure_password
  validates :email, :presence => true, :uniqueness => true
end
