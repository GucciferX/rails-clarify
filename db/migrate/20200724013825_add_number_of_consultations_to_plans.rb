class AddNumberOfConsultationsToPlans < ActiveRecord::Migration[6.0]
  def change
    add_column :plans, :number_of_consultations, :integer
  end
end
