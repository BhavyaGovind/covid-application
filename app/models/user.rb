class User < ApplicationRecord
  has_many :user_symptoms
  # has_and_belongs_to_many :symptoms, :through => :user_symptoms
  has_secure_password
  validates :email, :presence => true, :uniqueness => true
end
