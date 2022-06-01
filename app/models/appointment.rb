class Appointment < ApplicationRecord
  belongs_to :dog

  validates :scheduled_on, presence: true

  scope :after, ->(day) { where("scheduled_on > ?", day) }
  scope :deworming, -> { where(type: "Appointment::Deworming") }
  scope :grooming, -> { where(type: "Appointment::Grooming") }
  scope :vaccination, -> { where(type: "Appointment::Vaccination") }

  def self.next(dog)
    new(dog: dog, scheduled_on: dog.born_on + next_appointment_in_days(dog))
  end

  def self.next_appointment_in_days(dog)
    self::INITIAL_APPOINTMENTS.find { |days| days > dog.age_in_days }
  end
end
