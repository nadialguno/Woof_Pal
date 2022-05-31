class Schedule
  INITIAL_DEWORMING = [
    { delta: 15.days,  type: Appointment::Deworming },
    { delta: 30.days,  type: Appointment::Deworming },
    { delta: 45.days,  type: Appointment::Deworming },
    { delta: 106.days, type: Appointment::Deworming },
    { delta: 137.days, type: Appointment::Deworming },
    { delta: 167.days, type: Appointment::Deworming },
  ]

  INITIAL_GROOMING = [
    { delta: 183.days, type: Appointment::Grooming },
  ]

  INITIAL_VACCINATION = [
    { delta: 61.days,  type: Appointment::Vaccination },
    { delta: 76.days,  type: Appointment::Vaccination },
    { delta: 91.days,  type: Appointment::Vaccination },
    { delta: 106.days, type: Appointment::Vaccination },
    { delta: 122.days, type: Appointment::Vaccination },
    { delta: 137.days, type: Appointment::Vaccination },
    { delta: 152.days, type: Appointment::Vaccination },
    { delta: 167.days, type: Appointment::Vaccination },
  ]

  def initialize(dog)
    @dog = dog
  end

  def appointments
    #schedule generator
    #show upcoming appointment instances
  end

  def update
    # Returns without doing anything, if there are 3 persisted next appos

    # Make sure there are 3 persisted appos

    # If there are no appointments yet
    ## Generate the first 3 DW/VAX/GR
    # else
    ## Generate the needed ones, based
    ## on the interval since the last of the same kind
  end
end
