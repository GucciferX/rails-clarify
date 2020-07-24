class CoachRecord < ApplicationRecord
  belongs_to :user

  validates :certification_number, :specialty, :description, presence: true
  validates :user_id, uniqueness: { scope: :id}
end
