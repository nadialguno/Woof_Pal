class Appointment::Grooming < Appointment
  INTERVAL = 30.days
  INITIAL_APPOINTMENTS = [183.days]

  def description
    "[] Groom #{dog.name}"
  end

  def tip
    "Your pal may need extra care to maintain a beautiful, healthy skin and coat"
  end
end
