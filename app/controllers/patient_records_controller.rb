class PatientRecordsController < ApplicationController
  def show
    @patient_record = PatientRecord.find(params[:id])
    authorize @patient_record
  end

  def new
    @patient_record = PatientRecord.new
    authorize @patient_record
  end

  def create
    @patient_record = PatientRecord.new(record_params)
    authorize @patient_record
    @patient_record.user = current_user

    if @patient_record.save
      redirect_to users_show_path(current_user)
    else
      render users_show_path(current_user)
    end
  end

  def edit
    @patient_record = PatientRecord.find(params[:id])
    authorize @patient_record
  end

  def update
    @patient_record = PatientRecord.find(params[:id])
    authorize @patient_record

    if @patient_record.update(record_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  private

  def record_params
    params.require(:patient_record).permit(:first_name, :last_name, :gender, :birth_date,
                                           :weight, :height, :medical_condition, :description, :phone)
  end
end
