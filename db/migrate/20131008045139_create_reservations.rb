class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :parlo, index: true
      t.references :employee, index: true
      t.integer :status
      t.date :date_reservation
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
