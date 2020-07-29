class CoachRecord < ApplicationRecord
  belongs_to :user

  validates :user, :first_name, :last_name, :phone, :certification_number,
            :specialty, :description, presence: true
end
