class AddVaccinationAndDewormingToDogs < ActiveRecord::Migration[6.1]
  def change
    add_column :dogs, :vaccination, :integer
    add_column :dogs, :deworming, :integer
  end
end
