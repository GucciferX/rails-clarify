class PatientRecordsController < ApplicationController
  def new
    @record = PatientRecord.new
  end

  def create
    @record = PatientRecord.new(record_params)
    @user = User.find(current_user.id)
    @record.user = @user
    if @record.save
      redirect_to users_show_path(@user)
    else
      render "users/show"
    end
  end

  def edit
  end

  def update
  end

  private

  def record_params
    params.require(:record).permit(:first_name, :last_name, :gender, :birth_date,
                                   :weight, :height, :medical_condition, :description, :phone)
  end
end
