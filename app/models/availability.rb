class Availability < ApplicationRecord
  belongs_to :specialist

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :specialist, presence: true
  validates :location, presence: true
  validates :start_time, :end_time, overlap: { scope: "specialist_id" }


  # validate :cannot_overlap_another_event

#   scope :in_range, -> range {
#   where('BETWEEN ? AND ?', range.first, range.last)
# }
#   scope :exclude_self, -> id { where.not(id: id) }

#   def cannot_overlap_another_event
#   overlaps = Availability.where('BETWEEN ? AND ?', start_time, end_time)
#   overlap_error unless overlaps.empty?
#   end

#   def overlap_error
#     errors.add(:overlap, 'timeslots cannot overlap')
#   end

  def calender_formatting
    { id: id, start: start_time, end: end_time, title: location, description: "available from: #{start_time} to #{end_time}", url: "/agenda/#{id}" }
  end
end
