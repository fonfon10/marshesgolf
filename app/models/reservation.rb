class Reservation < ApplicationRecord

	belongs_to :activity
	belongs_to :member
	belongs_to :timeslot
end
