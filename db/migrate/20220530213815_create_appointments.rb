class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :type
      t.date :scheduled_on
      t.references :dog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
