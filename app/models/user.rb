class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :coach_record
  has_one :patient_record
  has_many :patient_consultations, class_name: "Consultation", foreign_key: "patient_id"
  has_many :coach_consultations, class_name: "Consultation", foreign_key: "coach_id"
  has_many :patients, through: :coach_consultations
  has_many :coaches, through: :patient_consultations
  has_many :plans, through: :consultations
  has_many :plan_coaches, class_name: "PlanCoach", foreign_key: "coach_id"

  validates :email, presence: true, uniqueness: true
end
