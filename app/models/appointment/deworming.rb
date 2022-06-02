class Appointment::Deworming < Appointment
  INTERVAL = 183.days
  INITIAL_APPOINTMENTS = [
    15.days, 30.days, 45.days, 106.days, 137.days, 167.days
  ]
end
