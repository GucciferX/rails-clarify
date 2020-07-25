class CreatePlanCoaches < ActiveRecord::Migration[6.0]
  def change
    create_table :plan_coaches do |t|
      t.references :coach
      t.references :plan, null: false, foreign_key: true

      t.timestamps
    end

    add_foreign_key :plan_coaches, :users, column: :coach_id, primary_key: :id
  end
end
