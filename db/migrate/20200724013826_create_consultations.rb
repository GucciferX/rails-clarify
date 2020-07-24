class CreateConsultations < ActiveRecord::Migration[6.0]
  def change
    create_table :consultations do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :patient
      t.references :coach
      t.references :plan, null: false, foreign_key: true
      t.boolean :accepted_by_coach

      t.timestamps
    end
    add_foreign_key :consultations, :users, column: :patient_id, primary_key: :id
    add_foreign_key :consultations, :users, column: :coach_id, primary_key: :id
  end
end

