class Appointment < ApplicationRecord
  belongs_to :dog

  validates :scheduled_on, presence: true

  scope :after, ->(day) { where("scheduled_on > ?", day) }
  scope :deworming, -> { where(type: "Appointment::Deworming") }
  scope :grooming, -> { where(type: "Appointment::Grooming") }
  scope :vaccination, -> { where(type: "Appointment::Vaccination") }
  scope :this_week, -> { where("scheduled_on BETWEEN :today AND :next_week", today: Date.current, next_week: Date.current.next_week) }
  scope :this_month, -> { where("scheduled_on BETWEEN :next_week AND :next_month", next_week: Date.current.next_week, next_month: Date.current.next_month) }

  def title
    self.class.name.gsub(/Appointment::/, "")
  end

  def soon?
    (scheduled_on - Date.today) < 7
  end

  def self.next(dog)
    new(dog: dog, scheduled_on: dog.born_on + next_appointment_in_days(dog))
  end

  def self.next_appointment_in_days(dog)
    next_initial_appointment_in_days(dog) || next_calculated_interval_appointment(dog)
  end

  def self.next_calculated_interval_appointment(dog)
    # Chance for a bug here
    result = self::INITIAL_APPOINTMENTS.last
    result += self::INTERVAL while result < dog.age_in_days
    result
  end

  def self.next_initial_appointment_in_days(dog)
    self::INITIAL_APPOINTMENTS.find { |days| days > dog.age_in_days }
  end
end
