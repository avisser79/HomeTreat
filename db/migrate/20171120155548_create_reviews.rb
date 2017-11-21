class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.string :rating
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
