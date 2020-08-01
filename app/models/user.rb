class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # connects user to record
  has_one :coach_record, dependent: :destroy
  has_one :patient_record, dependent: :destroy

  # connects coaches to plan
  has_many :plan_coaches, class_name: "PlanCoach", foreign_key: "coach_id"
  has_many :plans, through: :plan_coaches
  # connects user to consultations
  has_many :consultations
  # connects patient to plan
  has_many :plans, through: :consultations

  # connects patients to coaches
  has_many :coach_consultations, class_name: "Consultation", foreign_key: "coach_id", dependent: :destroy
  has_many :patient_consultations, class_name: "Consultation", foreign_key: "patient_id", dependent: :destroy
  has_many :coaches, through: :patient_consultations
  has_many :patients, through: :coach_consultations

  # connects coaches to reviews
  has_many :reviews, through: :consultations
  # connects patients to consultation_notes
  has_many :consultation_notes, through: :consultations

  accepts_nested_attributes_for :patient_record, :coach_record

  validates :email, presence: true, uniqueness: true

end
