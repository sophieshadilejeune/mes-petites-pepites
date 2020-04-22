# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying all places"

Place.destroy_all

puts "Destroying all categories"

Category.destroy_all

puts "Creating some categories"

grocery_store = Category.new(name: "Grocery Store")
grocery_store.save

park = Category.new(name: "Park")
park.save

restaurant = Category.new(name: "Restaurant")
restaurant.save

art = Category.new(name: "Art")
art.save

rooftop = Category.new(name: "Rooftop")
rooftop.save

puts "Categories have been created"

puts "Creating some places"

sonsa = Place.new(
  name: "Sonsa markets",
  address: "216-218 Smith St, Collingwood VIC 3066
",
description: "Turkish Supermarket",
category_id: grocery_store.id
)

sonsa.save
puts "Sonsa has been created"

carlton = Place.new(
  name: "The Carlton Club",
  address: "193 Bourke St, Melbourne VIC 3000",
  description: "Nice rooftop",
  category_id: rooftop.id

)

carlton.save
puts "Carlton has been created"

albert_park = Place.new(
  name: "Albert Park",
  address: "Albert Park Victoria 3206",
  description: "Best park to go cycling or running with nice views on the CBD ",
  category_id: park.id

  )

albert_park.save
puts "Albert Park has been created"





puts "Finished"



