class AddSpecializationToSpecialist < ActiveRecord::Migration[5.0]
  def change
    add_column :specialists, :specialization, :string
    add_column :specialists, :hourly_rate, :integer
  end
end
