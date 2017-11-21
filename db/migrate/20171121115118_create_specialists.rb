class CreateSpecialists < ActiveRecord::Migration[5.0]
  def change
    create_table :specialists do |t|
      t.text :bio
      t.string :work_experience
      t.integer :rating
      t.references :user

      t.timestamps
    end
  end
end
