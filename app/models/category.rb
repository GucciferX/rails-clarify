class Category < ApplicationRecord
  # belongs_to :plan
  has_many :plans, dependent: :destroy
  validates :name, presence: true
end
