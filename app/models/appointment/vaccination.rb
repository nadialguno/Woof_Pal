class Appointment::Vaccination < Appointment
  INTERVAL = 365.days
  INITIAL_APPOINTMENTS = [
    61.days, 76.days, 91.days, 106.days, 122.days, 137.days, 152.days, 167.days, 183.days
  ]

  def description
    "[] Vaccinate #{dog.name}"
  end
end
