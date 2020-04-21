# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating some places"

sonsa = Place.new(
  name: "Sonsa markets",
  address: "216-218 Smith St, Collingwood VIC 3066
",
description: "Turkish Supermarket" )

sonsa.save
puts "Sonsa has been created"

carlton = Place.new(
  name: "The Carlton Club",
  address: "193 Bourke St, Melbourne VIC 3000",
  description: "Nice rooftop"
)

carlton.save
puts "Carlton has been created"

albert_park = Place.new(
  name: "Albert Park",
  address: "Albert Park Victoria 3206",
  description: "Best park to go cycling or running with nice views on the CBD "
  )

albert_park.save
puts "Albert Park has been created"

puts "Finished"

