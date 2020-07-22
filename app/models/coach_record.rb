class CoachRecord < ApplicationRecord
  belongs_to :user

  validates :certification_number, :specialty, :description, presence: true
  validates :certification_number, uniqueness: true
end
