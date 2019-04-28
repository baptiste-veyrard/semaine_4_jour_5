# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
City.destroy_all
Listing.destroy_all
Reservation.destroy_all

20.times do 
	User.create(
		email: Faker::Internet.email,
		phone_number: ["0416721738", "0416231731", "0869721738", "0346723438", "0897643268", "0809876578"].sample,
		description: Faker::Lorem.characters(30)
		)
end

10.times do
	City.create(
		name: Faker::Address.city,
		zip_code: ["42400", "34000", "42000", "75000", "75200", "75016", "69000", "43000", "38000", "13000"].sample
		)
end

50.times do 
	Listing.create(
		available_beds: Faker::Number.between(1, 100),
		price: Faker::Number.between(20, 200),
		description: Faker::Lorem.characters(150),
		has_wifi: ["true", "false"].sample,
		welcome_message: Faker::Lorem.characters(50),
		admin: User.all.sample,
		city: City.all.sample
		)

	5.times do
		Reservation.create(
		start_date: Faker::Date.backward(50),
		end_date: Faker::Date.between(Faker::Date.backward(50), Date.today),
		guest: User.all.sample,
		listing: Listing.all.sample
		)
	end

	5.times do
		Reservation.create(
		start_date: Faker::Date.forward(50),
		end_date: Faker::Date.between(Faker::Date.forward(51), Faker::Date.forward(100)),
		guest: User.all.sample,
		listing: Listing.all.sample
		)
	end
end