class ConsultationsController < ApplicationController
  def index
    @consultations = policy_scope(Consultation)
  end

  def show
    @consultation = Consultation.find(params[:id])
    authorize @consultation
  end

  def new
    @plan = Plan.find(params[:plan])
    @coaches = @plan.coaches
    @consultation = Consultation.new
    authorize @consultation
  end

  def create
    @consultation = Consultation.new(consultation_params)
    @consultation.end_time = (@consultation.start_time.to_time + 1.hours).to_datetime
    @consultation.patient = current_user
    @consultation.coach = User.find(params[:consultation][:coach_id])
    authorize @consultation
    if @consultation.save
      redirect_to @consultation
    else
      render 'new'
    end
  end

  def edit
    @consultation = Consultation.find(params[:id])
    authorize @consultation
  end

  def update
    @consultation = Consultation.edit(consultation_params)
    authorize @consultation

    if @consultation.save
      redirect_to consultation_path(@consultation)
    else
      render 'new'
    end
  end

  def destroy
    @consultation = Consultation.find(params[:id])
    authorize @consultation
    @consultation.destroy
    redirect_to plan_path(@plan)
  end

  private

  def consultation_params
    params.require(:consultation).permit(:start_time, :plan_id)
  end
end
