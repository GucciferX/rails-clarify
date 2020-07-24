class CreatePatientRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_records do |t|
      t.string :description
      t.string :gender
      t.date :birth_date
      t.string :weight
      t.string :height
      t.string :medical_condition
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
