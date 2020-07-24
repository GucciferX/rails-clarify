class AddDefaultValueeToUserTypeAtrribute < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :user_type, :string, default: "patient"
  end
end
