# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying all users"

User.destroy_all

puts "Destroying all cities"

City.destroy_all

puts "Destroying all locations"

Location.destroy_all

puts "Destroying all categories"

Category.destroy_all

puts "Destroying all places"

Place.destroy_all

puts "Destroying all reviews"

Review.destroy_all

#------------------------------------------

puts "Creating users"

user1 = User.new(
  nickname: "User1",
  email: "user1@user.com",
  password: "password"
  )

user1.save

user2 = User.new(
  nickname: "User2",
  email: "user2@user.com",
  password: "password"
  )

user2.save

puts "2 Users created"

#--------------------------------------------

puts "Creating somes cities"

melbourne = City.new(name: "Melbourne")
melbourne.save

paris = City.new(name: "Paris")
paris.save

barcelona = City.new(name: "Barcelona")
barcelona.save

puts "3 cities have been created"

#--------------------------------------------

puts "Creating somes locations"

location1 = Location.new(
  city_id: melbourne.id,
  user_id: user1.id)

  location1.save

location2 = Location.new(
  city_id: paris.id,
  user_id: user1.id)

location2.save

location3 = Location.new(
  city_id: melbourne.id,
  user_id: user2.id)

location3.save


location4 = Location.new(
  city_id: barcelona.id,
  user_id: user2.id)

location4.save

#-------------------------------------------

puts "Creating some categories"

grocery_store = Category.new(
  name: "Grocery Store")
grocery_store.save

park = Category.new(
  name: "Park")
park.save

restaurant = Category.new(
  name: "Restaurant")
restaurant.save

rooftop = Category.new(
  name: "Rooftop")
rooftop.save

to_see = Category.new(
  name: "To see")
to_see.save

club = Category.new(
  name: "Clubs")
club.save

puts "Categories have been created"

#--------------------------------------------

puts "Creating some places"

sonsa = Place.new(
  name: "Sonsa markets",
  address: "216-218 Smith St, Collingwood VIC 3066
",
description: "Turkish Supermarket",
category_id: grocery_store.id,
city_id: melbourne.id
)
sonsa.user_id = user1.id

sonsa.save
puts "Sonsa has been created"

carlton = Place.new(
  name: "The Carlton Club",
  address: "193 Bourke St, Melbourne VIC 3000",
  description: "Nice rooftop",
  category_id: rooftop.id,
  city_id: melbourne.id

)
carlton.user_id = user1.id

carlton.save
puts "Carlton has been created"

albert_park = Place.new(
  name: "Albert Park",
  address: "Albert Park Victoria 3206",
  description: "Best park to go cycling or running with nice views on the CBD ",
  category_id: park.id,
  city_id: melbourne.id

  )
albert_park.user_id = user2.id
albert_park.save
puts "Albert Park has been created"

tour_eiffel = Place.new(
  name: "Tour Eiffel",
  address: "Champ de Mars, 5 Avenue Anatole France, 75007 Paris",
  description: "Most famous monument in the world",
  category_id: to_see.id,
  city_id: paris.id

  )
tour_eiffel.user_id = user1.id
  tour_eiffel.save

shoko = Place.new(
  name: "Shoko",
  address: "Passeig Marítim de la Barceloneta, 36, 08005 Barcelona",
  description: "restaurant and club",
  category_id: club.id,
  city_id: barcelona.id

  )
shoko.user_id = user2.id
shoko.save
puts "5 places created"


#--------------------------------------------


puts "Creating some reviews"

review1 = Review.new(
  content: "Amazing food",
  rating: 5,
  place_id: sonsa.id,
  user_id: user2.id
  )
review1.save

review2 = Review.new(
  content: "Nice area to go cycling with a nive view on the city",
  rating: 4,
  place_id: albert_park.id,
  user_id: user2.id
  )
review2.save

review3 = Review.new(
  content: "lorem ipsum",
  rating: 3,
  place_id: carlton.id,
  user_id: user1.id
  )
review3.save

puts "3 Reviews have been created"

puts "Finished"



