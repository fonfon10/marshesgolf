class DaysController < InheritedResources::Base

before_action :authenticate_member!


def index
#	@days = Day.first(7)

if Time.now.hour > 12 #for heroku timezone
	number_of_days = 7
else
	number_of_days = 6	
end

if current_member.membership.name != "Admin"
	@days = Day.where('name >= ?', Date.today).first(number_of_days)
else
	@days = Day.all
end


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




def edit
  @day = Day.find(params[:id])
  @open_closes = OpenClose.order('name ASC').map { |i| [i.name, i.id]}
end




  private

    def day_params
      params.require(:day).permit(:name, :open_close_id)
    end
end


