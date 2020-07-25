class UsersController < ApplicationController
  def show
    @user = current_user
    authorize @user
    # authorize @coaches = coaches
    # authorize @patients = patients
  end

  private

  def coaches
    current_user.coaches
  end

  def patients
    current_user.patients
  end
end
