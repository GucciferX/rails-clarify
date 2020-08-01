class CoachRecord < ApplicationRecord
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: ->(obj) { obj.address.present? && obj.address_changed? }

  validates :first_name, :last_name, :phone, :certification_number,
            :specialty, :description, presence: true
end
