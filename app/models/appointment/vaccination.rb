class Appointment::Vaccination < Appointment
  INTERVAL = 365.days
  INITIAL_APPOINTMENTS = [
    61.days, 76.days, 91.days, 106.days, 122.days, 137.days, 152.days, 167.days, 183.days
  ]

  def description
    "[] Vaccinate #{dog.name}"
  end

  def tip
    "Each dog has unique needs, so please check with your vet about appropriate vaccines and times to vaccinate your pal"
  end
end
