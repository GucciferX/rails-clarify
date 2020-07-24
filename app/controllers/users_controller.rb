class UsersController < ApplicationController
  before_action :find_user

  def show
  end

  def coaches
    # all_coaches = User.all.select {|user| kind == "coach"}
    # if @user.kind == "patient"
    #   @coaches = all_coaches.select {|coach| coach.patient_id = @user.id }
    # end
  end

  def patients
    # all_coaches = User.all.select {|user| kind == "coach"}
    # if @user.kind == "patient"
    #   @coaches = all_coaches.select {|coach| coach.patient_id = @user.id }
    # end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
