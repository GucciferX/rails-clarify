class ConsultationsController < ApplicationController
  def index
    @consultations = policy_scope(Consultation)
  end

  def show
    @consultation = Consultation.find(params[:id])
    authorize @consultation
  end

  def new
    @consultation = current_user.consultations.new
    authorize @consultation
  end

  def create
    @consultation = current_user.consultations.new(consultation_params)
    authorize @consultation

    @consultation.patient = current_user
    @consultation.plan = #plan
    @consultation.coach = #coach

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
    params.require(:consultation).permit(:start_time, :end_time)
  end
end
