class SplitDateAndTime < ActiveRecord::Migration[5.0]
  def change
    change_column :availabilities, :start_time, :time
    change_column :availabilities, :end_time, :time
    add_column :availabilities, :date, :date

    change_column :appointments, :start_time, :time
    change_column :appointments, :end_time, :time
    add_column :appointments, :date, :date
  end
end
