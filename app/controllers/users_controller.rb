class UsersController < ApplicationController
  def show
    authorize @user = current_user
    authorize @coaches = coaches
    authorize @patients = patients
  end

  private

  def coaches
    current_user.coaches
  end

  def patients
    current_user.patients
  end
end
