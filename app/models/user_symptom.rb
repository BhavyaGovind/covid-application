class UserSymptom < ApplicationRecord
  belongs_to :user, :optional => true
  belongs_to :symptom, :optional => true
end
