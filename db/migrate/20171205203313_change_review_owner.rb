class ChangeReviewOwner < ActiveRecord::Migration[5.0]
  def change
    remove_reference :reviews, :specialist, foreign_key: true, index: true
    add_reference :reviews, :appointment, foreign_key: true, index: true
  end
end
