class UsersController < ApplicationController
  def show
    @user = current_user
    authorize @user
    @record = set_record
    authorize @record
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
      if PatientRecord.find_by(user_id: current_user.id).nil?
        PatientRecord.new
      else
        PatientRecord.find_by(user_id: current_user.id)
      end
    else
      if CoachRecord.find_by(user_id: current_user.id).nil?
        CoachRecord.new
      else
        CoachRecord.find_by(user_id: current_user.id)
      end
    end
  end
end
