class Dog < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :appointments

  def age_in_days
    (Date.today - born_on).days
  end
end
