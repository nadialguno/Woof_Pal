class SchedulesController < ApplicationController
  # GET dogs/:dog_id/schedule
  def show
    dog = Dog.find(params[:dog_id])
    @schedule = Schedule.new(dog)
    @schedule.update!
  end
end
