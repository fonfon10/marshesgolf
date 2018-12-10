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
    redirect_to days_path
  else
    render 'new'
  end
  
end




def book_lesson
  @reservation = Reservation.find(params[:id])
  @reservation.update(member: current_member)
  activity_type_lesson = Activity.find_by name: 'Lesson'
  @reservation.update(activity: activity_type_lesson)

  @reservation.save
  redirect_to days_path
end

def book_practice
  @reservation = Reservation.find(params[:id])
  @reservation.update(member: current_member)
  activity_type_lesson = Activity.find_by name: 'Practice'
  @reservation.update(activity: activity_type_lesson)

  @reservation.save
  redirect_to days_path
end


def cancel
  o = Membership.find_by name: 'Operator'
  m = Member.find_by membership_id: o
  activity_type_lesson = Activity.find_by name: 'Open'

  @reservation = Reservation.find(params[:id])
  @reservation.update(member: m)
  @reservation.update(activity: activity_type_lesson)
  @reservation.save
  redirect_to days_path
end



def edit
  @reservation = Reservation.find(params[:id])
  @timeslots = Timeslot.order('start ASC').map { |i| [i.start, i.id]}
  @activities = Activity.order('name ASC').map { |i| [i.name, i.id]}

end




  private

    def reservation_params
      params.require(:reservation).permit(:timeslot_id, :member_id, :activity_id, :day)
    end
end

