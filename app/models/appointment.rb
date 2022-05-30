class Appointment < ApplicationRecord
  belongs_to :dog

  validates :scheduled_on, presence: true
end
