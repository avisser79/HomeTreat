class Availability < ApplicationRecord
  belongs_to :specialist

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :specialist, presence: true
  validates :location, presence: true
  validate :duplicate_Availability

  # def duplicate_Availability
  #   # check if start_time and end_time are not between start and end times from other availabilities
  #   timeslots = Specialist.includes(:availabilities).find(:specialist).availabilities.each do |timeslot|
  #     errors.add(:start_time, 'start time for timeslot cannot overlap other timeslots') if start_time in (timeslot.start_time..timeslot.end_time)
  #     errors.add(:end_time, 'end time for timeslot cannot overlap other timeslots') if end_time in (timeslot.start_time..timeslot.end_time)
  #     break
  #   end
  # end
end
