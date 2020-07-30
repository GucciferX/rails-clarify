class Review < ApplicationRecord
  belongs_to :consultation

  validates :comment, presence: true
end
