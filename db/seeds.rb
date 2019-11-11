# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'

puts "Destroy all instances"
User.destroy_all if Rails.env.development?
Flat.destroy_all if Rails.env.development?
Reservation.destroy_all if Rails.env.development?


puts "Create users"
# url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
# ingredients = JSON.parse(open(url).read)
# ingredients["drinks"].each do |ingredient|
#   i = Ingredient.create(name: ingredient["strIngredient1"])
#   puts "create #{i.name}"
100.times do
  User.create(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    email: Faker::Internet.email,
    password: Faker::Lorem.paragraph
    )
end

end
