class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :barber
      t.string :customer
      t.string :notes
      t.datetime :date

      t.timestamps
    end
  end
end
