class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :coach_record, dependent: :destroy
  has_one :patient_record, dependent: :destroy

  # conects plans for coaches
  has_many :plan_coaches, class_name: "PlanCoach", foreign_key: "coach_id"
  has_many :plans, through: :plan_coaches
  # conects plans for patients
  has_many :consultations
  has_many :plans, through: :consultations

  has_many :coach_consultations, class_name: "Consultation", foreign_key: "coach_id", dependent: :destroy
  has_many :coaches, through: :patient_consultations
  has_many :patient_consultations, class_name: "Consultation", foreign_key: "patient_id", dependent: :destroy
  has_many :patients, through: :coach_consultations


  accepts_nested_attributes_for :patient_record, :coach_record

  validates :email, presence: true, uniqueness: true
end
