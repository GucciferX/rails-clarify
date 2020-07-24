class Category < ApplicationRecord
  belongs_to :plan
  validates :name, presence: true
end
