class Review < ApplicationRecord
  belongs_to :consultation
  belongs_to :user

  validates :rating, presence: true
end
