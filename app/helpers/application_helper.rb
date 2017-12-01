module ApplicationHelper
    def appointment_formatting(availability)
    {
      id: availability.id,
      start: DateTime.new(availability.date.year, availability.date.month, availability.date.day, availability.start_time.hour, availability.start_time.min, availability.start_time.sec, availability.start_time.zone),
      end: DateTime.new(availability.date.year, availability.date.month, availability.date.day, availability.end_time.hour, availability.end_time.min, availability.end_time.sec, availability.end_time.zone),
      title: availability.location,
      description: "available from: #{availability.start_time} to #{availability.end_time}",
      # url: new_specialist_appointment_path(specialist_id: availability.specialist_id, availability_id: availability.id),
      year: availability.date.year,
      month: availability.date.month,
      day: availability.date.day
    }
  end
end
