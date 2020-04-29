# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying all users"

User.destroy_all

puts "Creating some users"

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

puts "Destroying all categories"

Category.destroy_all

puts "Creating some categories"

grocery_store = Category.new(
  name: "Grocery Store",
  user_id: 2)
grocery_store.save

park = Category.new(
  name: "Park",
  user_id: 2)
park.save

restaurant = Category.new(
  name: "Restaurant",
  user_id: 2)
restaurant.save

art = Category.new(
  name: "Art",
  user_id: 1)
art.save

rooftop = Category.new(
  name: "Rooftop",
  user_id: 1)
rooftop.save

puts "Categories have been created"

#--------------------------------------------


puts "Destroying all places"

Place.destroy_all

puts "Creating some places"

sonsa = Place.new(
  name: "Sonsa markets",
  address: "216-218 Smith St, Collingwood VIC 3066
",
description: "Turkish Supermarket",
category_id: grocery_store.id,
user_id: 2
)

sonsa.save
puts "Sonsa has been created"

carlton = Place.new(
  name: "The Carlton Club",
  address: "193 Bourke St, Melbourne VIC 3000",
  description: "Nice rooftop",
  category_id: rooftop.id,
  user_id: 1

)

carlton.save
puts "Carlton has been created"

albert_park = Place.new(
  name: "Albert Park",
  address: "Albert Park Victoria 3206",
  description: "Best park to go cycling or running with nice views on the CBD ",
  category_id: park.id,
  user_id: 2

  )

albert_park.save
puts "Albert Park has been created"

#--------------------------------------------

puts "Destroying all reviews"

Review.destroy_all

puts "Creating some reviews"

review1 = Review.new(
  content: "Amazing food",
  rating: 5
  )
review1.place_id = sonsa.id
review1.user_id = 1
review1.save!

review2 = Review.new(
  content: "Nice area to go cycling with a nive view on the city",
  rating: 4)
review2.place_id = albert_park.id
review2.user_id = 1
review2.save!

review3 = Review.new(
  content: "lorem ipsum",
  rating: 3
  )
review3.place_id = carlton.id
review3.user_id = 2
review3.save!

puts "3 Reviews have been created"

puts "Finished"



