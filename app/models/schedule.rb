class Schedule
  attr_reader :dog

  def initialize(dog, kept_count = 2, current_day = Date.today)
    @dog = dog
    @kept_count = kept_count
    @current_day = current_day
  end

  def next_appointments
    @dog
      .appointments
      .after(@current_day)
      .order(scheduled_on: :asc)
      .distinct(:type)
    # + next 3
  end

  def update!
    Appointment::Deworming.next(@dog).save! unless next_appointments.deworming.exists?
    Appointment::Grooming.next(@dog).save! unless next_appointments.grooming.exists?
    Appointment::Vaccination.next(@dog).save! unless next_appointments.vaccination.exists?
    @dog.reload

    [
      next_appointments.deworming.first,
      next_appointments.grooming.first,
      next_appointments.vaccination.first
    ].each do |appointment|
      @dog.appointments << appointment.next unless appointment.has_next?(@kept_count - 1)
    end
  end
end
