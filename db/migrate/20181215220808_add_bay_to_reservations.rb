class AddBayToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :bay, :integer
  end
end
