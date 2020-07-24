class CreateConsultationNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :consultation_notes do |t|
      t.text :comment
      t.references :consultation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
