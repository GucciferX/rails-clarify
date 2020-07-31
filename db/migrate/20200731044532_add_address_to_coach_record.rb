class AddAddressToCoachRecord < ActiveRecord::Migration[6.0]
  def change
    add_column :coach_records, :address, :text
  end
end
