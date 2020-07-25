class UsersController < ApplicationController
  def show
    @user = current_user
    authorize @user
    @record = set_record
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

  def set_record
    if current_user.kind == "patient"
      PatientRecord.find_by(user_id: current_user.id)
    else
      CoachRecord.find_by(user_id: current_user.id)
    end
  end
end
