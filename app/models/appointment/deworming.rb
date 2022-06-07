class Appointment::Deworming < Appointment
  INTERVAL = 30.days
  INITIAL_APPOINTMENTS = [
    15.days, 30.days, 45.days, 106.days, 137.days, 167.days
  ]

  def description
    "[] Deworm #{dog.name}"
  end
end
