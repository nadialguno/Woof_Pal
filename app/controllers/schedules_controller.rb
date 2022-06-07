class SchedulesController < ApplicationController
  skip_before_action :authenticate_user!, only: :webcal

  # GET dogs/:dog_id/schedule
  def show
    dog = Dog.find(params[:dog_id])
    @schedule = Schedule.new(dog)
    @schedule.update!
  end

  # GET dogs/:dog_id/schedule/download
  def download
    send_data calendar, filename: "hello.ics"
  end

  # GET dogs/:dog_id/schedule/webcal
  def webcal
    respond_to do |format|
      format.html { render plain: calendar }
      format.ics { render plain: calendar, content_type: 'text/calendar' }
    end
  end

  private

  def calendar
    dog = Dog.find(params[:dog_id])
    @schedule = Schedule.new(dog)

    hour_offset = (params[:hour_offset] || 0).to_i.hours

    cal = Icalendar::Calendar.new
    @schedule.next_appointments.each do |appointment|
      cal.event do |e|
        e.dtstart     = (appointment.scheduled_on + hour_offset)
        e.dtend       = (appointment.scheduled_on + hour_offset) + 1.day
        e.summary     = "#{appointment.title} for #{dog.name}"
        e.description = appointment.description
        e.ip_class    = "PUBLIC"
      end
    end
    cal.publish
    cal.to_ical
  end
end
