class DaysController < InheritedResources::Base

before_action :authenticate_member!


def index
#	@days = Day.first(7)
@days = Day.where('name >= ?', Date.today).first(7)
		
end


def show

	day = Day.find(params[:id])
	@reservations = Reservation.where('day_id = ?', day.id).order(timeslot_id: :asc)
#	cr = @reservations.where('member_id = ?', current_member.id)
	if member_signed_in?
  	@count_reservations = @reservations.where('member_id = ?', current_member.id).count
	end	
#  @count_reservations = cr.count

end


  private

    def day_params
      params.require(:day).permit(:name)
    end
end


