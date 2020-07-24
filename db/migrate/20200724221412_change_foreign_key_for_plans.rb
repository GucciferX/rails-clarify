class ChangeForeignKeyForPlans < ActiveRecord::Migration[6.0]
  def change
    rename_column :plans, :categories_id, :category_id
  end
end
