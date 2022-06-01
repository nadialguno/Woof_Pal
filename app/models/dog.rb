class Dog < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :appointments

  validates :name, :born_on, presence: true

  def age_in_days
    (Date.today - born_on).days
  end

  def age_display
    if (0..1).include?(age_in_days.in_years)
      "#{age_in_days.in_months.floor % 12} months"
    elsif (1..4).include?(age_in_days.in_years)
      "#{age_in_days.in_years.floor} years and #{age_in_days.in_months.floor % 12} months"
    elsif (4..Float::INFINITY).include?(age_in_days.in_years)
      "#{age_in_days.in_years.floor} years"
    end
  end
end
