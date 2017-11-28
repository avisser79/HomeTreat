class Availability < ApplicationRecord
  belongs_to :specialist

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :specialist, presence: true
  validates :location, presence: true
  validates :start_time, :end_time, overlap: { scope: "specialist_id" }
  validates :date, presence: true

  def calender_formatting
    {
      id: id,
      start: Datetime.new(date.year, date.month, date.day, start_time.hour, start_time.min, start_time.sec, start_time.zone)
      end: Datetime.new(date.year, date.month, date.day, end_time.hour, end_time.min, end_time.sec, end_time.zone)
      title: location,
      description: "available from: #{start_time} to #{end_time}",
      url: "/agenda/#{id}"
    }
  end


end
