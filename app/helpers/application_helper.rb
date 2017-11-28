module ApplicationHelper
    def appointment_formatting(availability)
    {
      id: availability.id,
      start: availability.start_time,
      end: availability.end_time,
      title: availability.location,
      description: "available from: #{availability.start_time} to #{availability.end_time}",
      url: new_specialist_appointment_path(specialist_id: availability.specialist_id, availability_id: availability.id)
    }
  end
end
