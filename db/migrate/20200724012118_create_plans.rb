class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.text :description
      t.integer :duration
      t.text :goal_description
      t.references :categories, null: false, foreign_key: true

      t.timestamps
    end
  end
end
