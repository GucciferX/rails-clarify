class ReviewsController < ApplicationController
  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.consultation = Consultation.find(params[:consultation_id])
    authorize @review
    if @review.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    authorize @review
  end

  def update
    @review = Review.find(params[:id])
    authorize @review

    if @review.update(review_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :coach_rating)
  end
end
