class AddPatientRatingToConsultationNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :consultation_notes, :patient_rating, :integer
  end
end
