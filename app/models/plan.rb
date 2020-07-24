class Plan < ApplicationRecord
  has_many :categories
  validates :name, presence: true
  validates :description, presence: true
  validates :goal_description, presence: true
  validates :duration, presence: true, numericality: { only_integer: true }
  validates :number_of_consultations, presence: true, numericality: { only_integer: true }
end
