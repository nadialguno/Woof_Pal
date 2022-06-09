class ReschedulesController < ApplicationController
  def new
    @appointment = Appointment.find(params[:appointment_id])
  end

  def create
    @appointment = Appointment.find(params[:appointment_id])
    # Save appoint date, pre-change
    old_date = @appointment.scheduled_on
    next_appointments = @appointment.dog.appointments.where(type: @appointment.type).after(old_date)

    # Update appointment with the new params
    if @appointment.update(appointment_params)
      new_date = @appointment.scheduled_on
      # Get delta between old and new date
      delta = new_date - old_date
      # Add delta to all future persisted appointments of the same kind
      next_appointments.where.not(id: @appointment).each do |appointment|
        appointment.update(scheduled_on: appointment.scheduled_on + delta)
      end

      # Add the delta to the relevant dog delay
      redirect_to dog_schedule_path(@appointment.dog)
    else
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:scheduled_on)
  end



end
