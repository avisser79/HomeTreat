class AddSpecialistRefToTreatments < ActiveRecord::Migration[5.0]
  def change
    add_reference :treatments, :specialist, foreign_key: true, index: true
    add_reference :treatments, :subcategory, foreign_key: true, index: true
  end
end
