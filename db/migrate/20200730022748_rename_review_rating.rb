class RenameReviewRating < ActiveRecord::Migration[6.0]
  def change
    rename_column :reviews, :rating, :coach_rating
  end
end
