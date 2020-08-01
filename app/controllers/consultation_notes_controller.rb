class ConsultationNotesController < ApplicationController
  def create
    @consultation = Consultation.find(params[:consultation_id])
    @note = Note.new(note_params)
    @note.consultation = @consultation
    if @note.save
      redirect_to consultation_path(@consultation)
    else
      render :new
    end
  end

  private

  def note_params
    params.require(:note).permit(:comment, :patient_rating)
  end
end
