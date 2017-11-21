class AddUserRefToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_reference :appointments, :user, foreign_key: true, index: true
    add_column :appointments, :start_time, :time
  end
end
