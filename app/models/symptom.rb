class Symptom < ApplicationRecord
  belongs_to :user_symptoms, :optional => true
end
