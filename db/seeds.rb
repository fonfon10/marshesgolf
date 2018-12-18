# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Timeslot.delete_all
Membership.delete_all
AgeGroup.delete_all
Activity.delete_all
Day.delete_all
Member.delete_all



# create time slots
starttime = 10
endtime = 20

while starttime < endtime do 
	ts = starttime.to_s+':00'
	Timeslot.create!(start: ts)
	ts = starttime.to_s+':30'
	Timeslot.create!(start: ts)
	starttime += 1
end	


#membership
membership_types = ['Operator','Practice', 'Coaching', 'Admin']

membership_types.each do |m|
	Membership.create!(name: m)
end


#age_group
age_group_types = ['Adult', 'Junior']
age_group_types.each do |a|
	AgeGroup.create!(name: a)
end


#activities
activity_types = ['Open','Practice', 'Lesson', 'Closed']
activity_types.each do |a|
	Activity.create!(name: a)
end


#day
day = Date.today
lastday = Date.new(2018,12,20)

while day <= lastday do
	Day.create!(name: day)
	day += 1
end



membership_type_Operator = Membership.first
membership_type_Admin = Membership.last
membership_type_Coaching = Membership.find_by name: 'Coaching'

age_group_type_adult = AgeGroup.first
age_group_type_junior = AgeGroup.last

activity_type_open = Activity.first
activity_type_closed = Activity.last



Member.create!(email: 'slafontaine10@gmail.com', password: 'numb10', password_confirmation: 'numb10', membership: membership_type_Admin, age_group: age_group_type_adult)
m = Member.create!(email: 'xx@xxx.com', password: 'numb10', password_confirmation: 'numb10', membership: membership_type_Operator, age_group: age_group_type_adult)
Member.create!(email: 'ashley@gmail.com', password: 'numb10', password_confirmation: 'numb10', membership: membership_type_Coaching, age_group: age_group_type_junior)
Member.create!(email: 'derek.macdonald@marshesgolfclub.com', password: 'golf123', password_confirmation: 'golf123', membership: membership_type_Coaching, age_group: age_group_type_adult)
Member.create!(email: 'serge@serge.com', password: 'numb10', password_confirmation: 'numb10', membership: membership_type_Operator, age_group: age_group_type_adult)


@days = Day.all
@timeslots = Timeslot.all

@days.each do |d|
	@timeslots.each do |t|
		Reservation.create!(timeslot: t, member: m, day: d, activity: activity_type_open, bay: 1 )
		Reservation.create!(timeslot: t, member: m, day: d, activity: activity_type_open, bay: 2 )
	end
end	


AdminUser.create!(email: 'slafontaine10@gmail.com', password: 'numb10', password_confirmation: 'numb10')
