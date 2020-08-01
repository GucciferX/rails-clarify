class Review < ApplicationRecord
  belongs_to :consultation

  after_create :update_coach_rating

  validates :comment, presence: true

  private

  def update_coach_rating
    if consultation.coach.rating.nil?
      consultation.coach.rating = coach_rating
    else
      review_coach_consultations = Consultation.where(coach: consultation.coach)
      divisor = review_coach_consultations.select { |cons| cons.review.present? }.count

      consultation.coach.rating = (consultation.coach.rating + coach_rating).fdiv(divisor)
    end
    consultation.coach.save!
  end
end
