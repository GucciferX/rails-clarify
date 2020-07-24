class PatientRecord < ApplicationRecord
  belongs_to :user

  validates :user, :gender, :birth_date, :weight, :height, :medical_condition, presence: true
  # validates :height, inclusion: { in: (0.5..3), message: "%<value> is not a valid size" }
end
