class ConsultationNote < ApplicationRecord
  belongs_to :consultation

  validates :comment, presence: true
end
