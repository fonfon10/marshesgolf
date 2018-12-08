class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.integer :timeslot_id
      t.integer :member_id
      t.integer :activity_id
      t.date :day

      t.timestamps
    end
  end
end
