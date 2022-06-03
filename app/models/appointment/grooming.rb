class Appointment::Grooming < Appointment
  INTERVAL = 14.days
  INITIAL_APPOINTMENTS = [183.days]

  def description
    "[] Groom #{dog.name}"
  end
end
