class Consultation < ApplicationRecord
  belongs_to :patient
  belongs_to :coach
  belongs_to :plan
  has_one :consultation_note
  has_many :reviews
end
