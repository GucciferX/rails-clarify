class CreateCoachRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :coach_records do |t|
      t.string :certification_number
      t.string :specialty
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
