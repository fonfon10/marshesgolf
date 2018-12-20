class DaysController < InheritedResources::Base

before_action :authenticate_member!


def index
#	@days = Day.first(7)

if Time.now.hour > 12 #for heroku timezone
	number_of_days = 7
else
	number_of_days = 6	
end


@days = Day.where('name >= ?', Date.today).first(number_of_days)
#@days = Day.where('name >= ?', Date.today).first(7)
		
end


def show
	nextDay = params[:id].to_i+1

  @nextDay = Day.find(nextDay)


	day = Day.find(params[:id])
	@reservations = Reservation.where('day_id = ?', day.id).order(id: :asc)
#	@reservations = r.order(id: :asc)
#	cr = @reservations.where('member_id = ?', current_member.id)
	if member_signed_in? and current_member.membership.name != "Operator"
  	@count_reservations = @reservations.where('member_id = ?', current_member.id).count
	end	
#  @count_reservations = cr.count

end


  private

    def day_params
      params.require(:day).permit(:name)
    end
end


