class Appointment::Grooming < Appointment
  INTERVAL = 30.days
  INITIAL_APPOINTMENTS = [183.days]

  def description
    "[] Groom #{dog.name}"
  end
end
