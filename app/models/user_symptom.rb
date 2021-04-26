class UserSymptom < ApplicationRecord
  belongs_to :users
  has_many :symptoms
end
