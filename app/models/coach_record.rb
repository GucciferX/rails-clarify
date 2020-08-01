class CoachRecord < ApplicationRecord
  belongs_to :user

  # Cloudinary association
  has_one_attached :profile_picture

  geocoded_by :address
  after_validation :geocode, if: ->(obj) { obj.address.present? && obj.address_changed? }

  validates :first_name, :last_name, :phone, :certification_number,
            :specialty, :description, presence: true
end
