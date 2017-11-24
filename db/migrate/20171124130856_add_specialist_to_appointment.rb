class AddSpecialistToAppointment < ActiveRecord::Migration[5.0]
  def change
    add_reference :appointments, :specialist, foreign_key: true
    remove_column :appointments, :start_time, :time
    add_column :appointments, :start_time, :datetime
  end
end
