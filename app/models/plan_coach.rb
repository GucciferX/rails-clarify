class PlanCoach < ApplicationRecord
  belongs_to :coach, class_name: "User"
  belongs_to :plan
end
