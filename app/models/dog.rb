class Dog < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :appointments

  validates :name, :born_on, presence: true

  def age_in_days
    (Date.today - born_on).days
  end

  def dog
    self
  end

  def interval
    age_in_days
  end

  def age_display
    case age_in_days.in_years
    when 0..1
      if age_in_days.in_months > 1
        "#{age_in_days.in_months.floor} months"
      else
        "#{age_in_days.in_days.floor} days"
      end
    when 1..4
      "#{age_in_days.in_years.floor} years and #{age_in_days.in_months.floor % 12} months"
    when 4..Float::INFINITY
      "#{age_in_days.in_years.floor} years"
    end
  end
end
