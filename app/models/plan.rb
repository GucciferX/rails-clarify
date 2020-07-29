class Plan < ApplicationRecord
  belongs_to :category
  has_many :consultations
  has_many :plan_coaches
  has_many :coaches, through: :plan_coaches

  validates :name, :description, :goal_description, :duration, :number_of_consultations, presence: true
  validates :duration, :number_of_consultations, numericality: { only_integer: true }
end
