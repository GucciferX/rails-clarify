class CoachRecordsController < ApplicationController
  def show
    @coach_record = CoachRecord.find(params[:id])
    authorize @coach_record
  end

  def new
    @coach_record = CoachRecord.new
    authorize @coach_record
  end

  def create
    @coach_record = CoachRecord.new(record_params)
    authorize @coach_record
    @coach_record.user = current_user

    if @coach_record.save
      redirect_to user_coach_record_path(@coach_record)
    else
      render new
    end
  end

  def edit
    @coach_record = CoachRecord.find(params[:id])
    authorize @coach_record
  end

  def update
    @coach_record = CoachRecord.find(params[:id])
    authorize @coach_record

    if @coach_record.update(record_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  private

  def record_params
    params.require(:coach_record).permit(:first_name, :last_name, :certification_number, :description, :phone, :address)
  end
end
