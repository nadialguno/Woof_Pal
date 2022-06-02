class SchedulesController < ApplicationController
  # GET dogs/:dog_id/schedule
  def show
    dog = Dog.find(params[:dog_id])
    @schedule = Schedule.new(dog)
    @schedule.update!
  end

  # GET dogs/:dog_id/schedule/download
  def download
    dog = Dog.find(params[:dog_id])
    @schedule = Schedule.new(dog)

    cal = Icalendar::Calendar.new
    @schedule.next_appointments.each do |appointment|
      cal.event do |e|
        e.dtstart     = appointment.scheduled_on
        e.dtend       = appointment.scheduled_on + 1.day
        e.summary     = "#{appointment.title} for #{dog.name}"
        e.description = appointment.description
        e.ip_class    = "PRIVATE"
      end
    end

    send_data cal.to_ical, filename: "hello.ics"
  end
end
