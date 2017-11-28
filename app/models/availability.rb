class Availability < ApplicationRecord
  belongs_to :specialist

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :specialist, presence: true
  validates :location, presence: true
  validates :start_time, :end_time, overlap: { scope: "specialist_id" }

  def calender_formatting
    { id: id, start: start_time, end: end_time, title: location, description: "available from: #{start_time} to #{end_time}", url: "/agenda/#{id}" }
  end
end
