class CalendarController < ApplicationController
  def index

  	@timeslots = Timeslot.all.order('start ASC')
  	@todayreservations = Reservation.where('day = ?', Date.today).order('timeslot_id ASC')







  end
end
