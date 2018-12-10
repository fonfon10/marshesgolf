class DaysController < InheritedResources::Base


def index
	@days = Day.first(7)
		
end


def show

	day = Day.find(params[:id])
	@reservations = Reservation.where('day_id = ?', day.id).order(timeslot_id: :asc)
end


  private

    def day_params
      params.require(:day).permit(:name)
    end
end

