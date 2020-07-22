class PatientRecord < ApplicationRecord
  belongs_to :user

  validates :gender, :birth_date, :weight, :height, :medical_condition, presence: true
  validates :weight, inclusion: { in: (0.5..3), message: "%{value} is not a valid size" }
end
