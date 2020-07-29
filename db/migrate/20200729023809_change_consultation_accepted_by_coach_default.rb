class ChangeConsultationAcceptedByCoachDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :consultations, :accepted_by_coach, :boolean, default: false
  end
end
