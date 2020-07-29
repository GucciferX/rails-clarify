class PatientRecord < ApplicationRecord
  belongs_to :user

  validates :user, :first_name, :last_name, :phone, :gender, :birth_date,
            :weight, :height, :medical_condition, presence: true
end
