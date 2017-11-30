class AddReviewsToSpecialists < ActiveRecord::Migration[5.0]
  def change
    add_column :specialists, :review_id, :integer, index: true
    add_foreign_key :specialists, :reviews
  end
end
