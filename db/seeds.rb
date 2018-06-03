# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def get_random_days
	days = ''

	while days.length < 3
		randay = ['0', '1', '2', '3', '4', '5', '6'].sample
		days += randay unless days.include?(randay)
	end

	return days.split('').map(&:to_i).sort.join('')
end

def get_random_time_schedules
	[ '07:30am - 10:30am', '10:30am - 01:30pm', '01:30pm - 03:30pm', '03:30pm - 06:30pm', '06:30pm - 09:00pm'
	].sample
end

subjects = [
	{ code: 'PBDIT 4043', name: 'Software Engineering' },
	{ code: 'MIT 616', name: 'Business Process Reengineering' },
	{ code: 'MIT 595', name: 'Systems Analysis and Design (Pre-MIT)' },
	{ code: 'MIT 621', name: 'Computer Information Networks' },
	{ code: 'MIT 614', name: 'Project Management Information System' },
	{ code: 'MIT 611', name: 'Data Warehouse Technology & Implementation Strategies' },
	{ code: 'RSH 630', name: 'Research Seminar 1' },
	{ code: 'MIT 604', name: 'Advanced Programming' },
	{ code: 'MIT 630', name: 'Advanced Operating System' },
	{ code: 'MIT 624', name: 'Technical Services Management' },
	{ code: 'MIT 627', name: 'Statistics for IT Research' },
	{ code: 'MIT 631', name: 'Advanced Systems Design and Implementation' },
	{ code: 'RSH 631', name: 'Research Seminar 2' }
]

if Subject.take.nil?
	puts "Creating Pre-loaded Subjects..."
	subjects.each { |subject| Subject.create!(subject) }
end

professors = [
	{ name: 'Casey Hardy' },
	{ name: 'Nathaniel	Rose' },
	{ name: 'Kurt Walsh' },
	{ name: 'Kent Murray' },
	{ name: 'Marc Gonzales' },
	{ name: 'Tamara Conner' },
	{ name: 'Kelly Ward' },
	{ name: 'Christopher Carter' },
	{ name: 'Ellen Owens' },
	{ name: 'Anna Sharp' }
]

if Professor.take.nil?
	puts "Creating Pre-loaded Professors..."
	professors.each { |professor| Professor.create(professor) }
end

students = [
	{ name: 'Bonnie West' },
	{ name: 'Gregg Nunez' },
	{ name: 'Eddie Sullivan' },
	{ name: 'Joey Roy' },
	{ name: 'Paul Howell' },
	{ name: 'Rufus Leonard' },
	{ name: 'Geneva Fleming' },
	{ name: 'Jeannie Lee' },
	{ name: 'Johnathan Abbott' },
	{ name: 'Steven Mckinney' },
	{ name: 'Gertrude Little' },
	{ name: 'Candice Luna' },
	{ name: 'Gilberto Young' },
	{ name: 'Cecilia Marsh' },
	{ name: 'Winston Mason' },
	{ name: 'Juanita May' },
	{ name: 'Doreen Rios' },
	{ name: 'Eleanor Curry' },
	{ name: 'Cornelius Schneider' },
	{ name: 'Cameron Sanders' },
	{ name: 'Lyle Martin' },
	{ name: 'Bill Banks' },
	{ name: 'Miguel Martinez' },
	{ name: 'Rolando Mccormick' },
	{ name: 'Toby Carroll' }
]

if Student.take.nil?
	puts "Creating Pre-loaded Students..."
	students.each { |student| Student.create(student) }
end

if ClassSchedule.take.nil?
	puts "Creating Pre-loaded Class Schedules..."
	10.times do
		ClassSchedule.create!(
			professor: Professor.order("RAND()").take,
			subject: Subject.order("RAND()").take,
			days: get_random_days,
			time_schedule: get_random_time_schedules,
			room: rand(100...700)
		)
	end
end