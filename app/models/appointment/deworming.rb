class Appointment::Deworming < Appointment
  INTERVAL = 30.days
  INITIAL_APPOINTMENTS = [
    15.days, 30.days, 45.days, 106.days, 137.days, 167.days
  ]

  def description
    "[] Deworm #{dog.name}"
  end

  def tip
    "Don't forget to ask your vet about external parasites treatment once a month"
  end
end
