class PatientRecordsController < ApplicationController
  def new
    @patient_record = current_user.patient_record.new
    authorize @patient_record
  end

  def create
    @patient_record = current_user.patient_record.new(record_params)
    authorize @patient_record

    @patient_record.user = current_user
    if @patient_record.save
      redirect_to users_show_path(current_user)
    else
      render users_show_path(current_user)
    end
  end

  def edit
  end

  def update
  end

  private

  def record_params
    params.require(:patient_record).permit(:first_name, :last_name, :gender, :birth_date,
                                           :weight, :height, :medical_condition, :description, :phone)
  end
end
