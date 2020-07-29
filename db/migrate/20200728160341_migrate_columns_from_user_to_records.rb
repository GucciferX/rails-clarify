class MigrateColumnsFromUserToRecords < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :phone
    change_column :users, :rating, :float
    add_column :patient_records, :first_name, :string
    add_column :patient_records, :last_name, :string
    add_column :patient_records, :phone, :string
    add_column :coach_records, :first_name, :string
    add_column :coach_records, :last_name, :string
    add_column :coach_records, :phone, :string
  end
end
