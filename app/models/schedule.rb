class Schedule
  attr_reader :dog

  def initialize(dog, current_day = Date.today)
    @dog = dog
    @current_day = current_day
  end

  def next_appointments
    @dog.appointments.after(@current_day).order(scheduled_on: :asc)
  end

  def update!
    Appointment::Deworming.next(@dog).save! unless next_appointments.deworming.exists?
    Appointment::Grooming.next(@dog).save! unless next_appointments.grooming.exists?
    Appointment::Vaccination.next(@dog).save! unless next_appointments.vaccination.exists?
    @dog.reload
  end
end
