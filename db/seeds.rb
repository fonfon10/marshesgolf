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
lastday = Date.new(2019,03,31)

while day <= lastday do
	Day.create!(name: day)
	day += 1
	if day.monday? 
		day += 1
	end
end



membership_type_Operator = Membership.first
membership_type_Admin = Membership.last
membership_type_Coaching = Membership.find_by name: 'Coaching'
membership_type_Practice = Membership.find_by name: 'Practice'

age_group_type_adult = AgeGroup.first
age_group_type_junior = AgeGroup.last

activity_type_open = Activity.first
activity_type_closed = Activity.last



#Member.create!(email: 'slafontaine10@gmail.com', password: 'numb10', password_confirmation: 'numb10', membership: membership_type_Admin, age_group: age_group_type_adult)
m = Member.create!(firstname: '', lastname: '', email: 'derek.macdonald@marshesgolfclub.com', password: 'numb10', password_confirmation: 'numb10', membership: membership_type_Operator, age_group: age_group_type_adult)
#Member.create!(email: 'ashley@gmail.com', password: 'numb10', password_confirmation: 'numb10', membership: membership_type_Coaching, age_group: age_group_type_junior)
#Member.create!(email: 'derek.macdonald@marshesgolfclub.com', password: 'golf123', password_confirmation: 'golf123', membership: membership_type_Coaching, age_group: age_group_type_adult)
#Member.create!(email: 'serge@serge.com', password: 'numb10', password_confirmation: 'numb10', membership: membership_type_Operator, age_group: age_group_type_adult)


members = [["Maddy","Pytura","michaelpytura@gmail.com","golf123",membership_type_Coaching,age_group_type_junior],
["Stephan","du Plooy","cdplooy@gmail.com","golf123",membership_type_Coaching,age_group_type_junior],
["Ashley","Lafontaine","ashleylafontaine27@gmail.com","golf123",membership_type_Coaching,age_group_type_junior],
["Ian ","Clark","iclark@marks-clerk.ca","golf123",membership_type_Coaching,age_group_type_adult],
["Doug","Hewson","dhewson@portlandpe.com","golf123",membership_type_Coaching,age_group_type_adult],
["Chelsea","Fracke","kfracke@hotmail.com","golf123",membership_type_Coaching,age_group_type_adult],
["Jo-Anne","Armstrong","jo.armstrong@armelec.ca ","golf123",membership_type_Coaching,age_group_type_adult],
["Gillian","Burnside","gillianburnside@rogers.com","golf123",membership_type_Coaching,age_group_type_adult],
["Jeff","Hurdis","jeffhurdis@gmail.com","golf123",membership_type_Coaching,age_group_type_adult],
["Rose ","de Guzman","rdeguzman@notusually.com","golf123",membership_type_Coaching,age_group_type_adult],
["Colin","Pallag","cpallag@gmail.com","golf123",membership_type_Coaching,age_group_type_adult],
["Peter","Strom","peter.strom6@gmail.com","golf123",membership_type_Coaching,age_group_type_adult],
["Kim ","Green","88kimgreen@gmail.com","golf123",membership_type_Coaching,age_group_type_adult],
["Tom","Elmslie","telmslie@fmpe.org","golf123",membership_type_Coaching,age_group_type_adult],
["Cindy","Lim","cindylim09@gmail.com","golf123",membership_type_Coaching,age_group_type_adult],
["Jason","Fraser","jaydfraser@gmail.com","golf123",membership_type_Coaching,age_group_type_adult],
["Allen ","Hopley","allen.hopley@gmail.com","golf123",membership_type_Coaching,age_group_type_adult],
["Dave","Beattie","dbjet@rogers.com","golf123",membership_type_Coaching,age_group_type_adult],
["Evan ","Smith","ensmith@rogers.com","golf123",membership_type_Coaching,age_group_type_adult],
["Adam ","MacRae","adam-macrae@hotmail.com","golf123",membership_type_Coaching,age_group_type_adult],
["Ammie","Fu","fyhammie@hotmail.com ","golf123",membership_type_Coaching,age_group_type_adult],
["Jeffrey","Zheng","abcd1@xxx.com","golf123",membership_type_Coaching,age_group_type_adult],
["Serge","Lafontaine","slafontaine10@gmail.com","golf123",membership_type_Admin,age_group_type_adult],
["Ellis","Kinnaird","breakinnaird@gmail.com","golf123",membership_type_Coaching,age_group_type_adult],
["Bruce ","Hiscock","can6180@shaw.ca","golf123",membership_type_Coaching,age_group_type_adult],
["Kathleen","Parker","rkparker@pgonline.com","golf123",membership_type_Coaching,age_group_type_adult],
["Jaco","du Plooy","cdplooy2@gmail.com","golf123",membership_type_Coaching,age_group_type_adult],
["Tim ","Orr","Timothy.orr@cibc.ca","golf123",membership_type_Coaching,age_group_type_adult],
["Brandon","Noseworthy","brandon.noseworthy@hotmail.com","golf123",membership_type_Practice,age_group_type_adult],
["David","So","davidso3333@yahoo.com","golf123",membership_type_Practice,age_group_type_adult],
["Peter","Rywak","prywak@cwottawa.com","golf123",membership_type_Practice,age_group_type_adult],
["Will","Rado","will.rado@gmail.com","golf123",membership_type_Practice,age_group_type_adult],
["Gregg","Shimokura","gregg.shimokura@yahoo.com","golf123",membership_type_Practice,age_group_type_adult],
["Mark ","Wu","mark.mlwu@gmail.com","golf123",membership_type_Practice,age_group_type_adult],
["George ","Taronno","george.stingray@gmail.com","golf123",membership_type_Practice,age_group_type_adult],
["Jo ","Aldyne","joaldyne@hotmail.com","golf123",membership_type_Practice,age_group_type_adult],
["Ken ","Hearn","Ken.Hearn@curtisswright.com ","golf123",membership_type_Practice,age_group_type_adult],
["Rob ","McNeil","robert.t.mcneil@gmail.com","golf123",membership_type_Practice,age_group_type_adult],
["Rocco ","Marcantonio","rocco.marcantonio@nordion.com","golf123",membership_type_Practice,age_group_type_adult],
["Justin ","Saunders","quinn.cindy@gmail.com","golf123",membership_type_Practice,age_group_type_adult],
["Sam ","Kloppenburg","sklopp1001@gmail.com","golf123",membership_type_Practice,age_group_type_adult],
["James","Baillie","jbaille@outlook.com","golf123",membership_type_Practice,age_group_type_adult],
["Ron ","Arnold","ronharnold@gmail.com","golf123",membership_type_Practice,age_group_type_adult],
["Kerrey","Zheng","abcd2@xxx.com","golf123",membership_type_Practice,age_group_type_adult],
["Sean ","Miller","miller33@mail.com","golf123",membership_type_Practice,age_group_type_adult],
["Norm","Wong","wong.norm@rogers.com","golf123",membership_type_Practice,age_group_type_adult],
["Carol","Pelger-Downing","cpelgerdowning@gmail.com","golf123",membership_type_Practice,age_group_type_adult],
["Jamie","Mills","Jmills@blg.com","golf123",membership_type_Practice,age_group_type_adult]]



members.each do |m|
	Member.create!(firstname: m[0], lastname: m[1], email: m[2], password: m[3], password_confirmation: m[3], membership: m[4], age_group: m[5])
end




@days = Day.all
@timeslots = Timeslot.all

@days.each do |d|
	@timeslots.each do |t|

		if d.name.sunday? and (t.start.hour < 11 or t.start.hour > 18)
			Reservation.create!(timeslot: t, member: m, day: d, activity: activity_type_closed, bay: 1 )
			Reservation.create!(timeslot: t, member: m, day: d, activity: activity_type_closed, bay: 2 )
		else
			Reservation.create!(timeslot: t, member: m, day: d, activity: activity_type_open, bay: 1 )
			Reservation.create!(timeslot: t, member: m, day: d, activity: activity_type_open, bay: 2 )
		end
	end
end	


AdminUser.create!(email: 'admin@admin.com', password: 'numb10', password_confirmation: 'numb10')
