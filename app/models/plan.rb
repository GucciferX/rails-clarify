class Plan < ApplicationRecord
  # has_many :categories
  belongs_to :category
  validates :name, :description, :goal_description, :duration, :number_of_consultations, presence: true
  validates :duration, :number_of_consultations, numericality: { only_integer: true }
end
