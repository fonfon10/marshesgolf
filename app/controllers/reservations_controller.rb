class ReservationsController < InheritedResources::Base



def new
  @reservation = Reservation.new
  @timeslots = Timeslot.order('start ASC').map { |i| [i.start, i.id]}
  @activities = Activity.order('name ASC').map { |i| [i.name, i.id]}

end

def create
  @reservation = Reservation.new(reservation_params)




  @reservation.timeslot_id = params[:timeslot_id]

  puts @reservation.timeslot_id



  @reservation.member_id = current_member.id


  puts @reservation.member_id

  @reservation.activity_id = params[:activity_id]

puts @activity_id



  if @reservation.save
    redirect_to reservations_path
  else
    render 'new'
  end
  
end








  private

    def reservation_params
      params.require(:reservation).permit(:timeslot_id, :member_id, :activity_id, :day)
    end
end

