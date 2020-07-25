class CoachRecord < ApplicationRecord
  belongs_to :user

  validates :user, :certification_number, :specialty, :description, presence: true
end
