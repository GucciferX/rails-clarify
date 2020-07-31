class UsersController < ApplicationController
  def show
    @user = current_user
    authorize @user
  end

  def dashboard
    @user = current_user
    authorize @user
    @consultations = Consultation.where(patient: @user)
    @plans = []
    @consultations.each do |consultation|
      @plans << consultation.plan
    end
  end
end
