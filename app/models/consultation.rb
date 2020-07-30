class Consultation < ApplicationRecord
  belongs_to :patient, class_name: "User"
  belongs_to :coach, class_name: "User"
  belongs_to :plan

  has_one :consultation_note
  has_many :reviews

  validates :start_time, :end_time, presence: true
end
