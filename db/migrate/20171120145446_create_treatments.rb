class CreateTreatments < ActiveRecord::Migration[5.0]
  def change
    create_table :treatments do |t|
      t.string :description
      t.integer :price
      t.integer :duration
      t.string :segment
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
