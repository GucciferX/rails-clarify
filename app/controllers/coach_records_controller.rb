class CoachRecordsController < ApplicationController
  def new
    @record = CoachRecord.new
  end

  def create
    @record = CoachRecord.new(record_params)
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
    params.require(:record).permit(:first_name, :last_name, :certification_number, :description, :phone)
  end
end
