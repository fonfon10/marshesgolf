class ModifyDayToReservation < ActiveRecord::Migration[5.1]
  def change
  	rename_column :reservations, :day, :day_id
  	change_column :reservations, :day_id, :integer 
  end
end
