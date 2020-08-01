class AddCoordinatesToCoachRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :coach_records, :latitude, :float
    add_column :coach_records, :longitude, :float
  end
end
