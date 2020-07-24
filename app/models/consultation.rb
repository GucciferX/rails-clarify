class Consultation < ApplicationRecord
  belongs_to :patient
  belongs_to :coach
  belongs_to :plan
end
