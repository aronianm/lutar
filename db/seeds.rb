# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if Rails.env == "development"
	pronous = ['Woman', 'Man', 'Transgender', 'Non-binary/non-conforming', 'Prefer not to respond']
	levels = ["Beginner", "Intermediate", "Advanced"]
	states = CS.states(:us)
	make = 100
	prices = (1..25).to_a.map{ |c| (c/1.0) - 0.01}
	ratings = [1,2,3,4,5,1.5, 2.5, 3.5, 4.5]
	6.times do 
		prices.push(25.99)
		prices.push(45.99)
	end
	make.times do |i|
		state = states.keys.sample
		city = CS.cities(state, :us)
		fname = Faker::Name.first_name
		lname = Faker::Name.last_name
		u = {fname: fname,
			 lname: lname,
			 email: "#{fname}.#{lname}@gmail.com",
			 city: city.sample,
			 state: state,
			 bio_line: Faker::Lorem.paragraph_by_chars(number: 210),
			 validated: true,
			 rating: ratings.sample * 1.0,
			 monthly_price: prices.sample}
		u[:password] = 'secret'
		
		already_existed = Trainor.find_by(email: u[:email])
		unless already_existed
			if i == (make/2).to_i
				puts 'half way'
			elsif i == (make/3).to_i
				puts 'third'
			end
			user = Trainor.create(u)
		end
	end
end