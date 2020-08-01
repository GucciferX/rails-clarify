class PatientRecord < ApplicationRecord
  belongs_to :user


  # Cloudinary association
  has_one_attached :profile_picture

  # validates :first_name, :last_name, :phone, :gender, :birth_date,
            # :weight, :height, :medical_condition, presence: true
end
