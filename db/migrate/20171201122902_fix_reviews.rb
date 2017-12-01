class FixReviews < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key(:specialists, :reviews)
    remove_column(:specialists, :review_id, :integer, {:index=>true})
    add_reference :reviews, :specialist, foreign_key: true, index: true
  end
end
