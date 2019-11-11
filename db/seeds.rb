require 'faker'
require 'open-uri'

puts "Destroy all instances"
User.destroy_all if Rails.env.development?
Flat.destroy_all if Rails.env.development?
Reservation.destroy_all if Rails.env.development?


puts "Create users"
100.times do
  User.create(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    description: Faker::Lorem.paragraph,
    avatar: "dbr7upry2jb7eulcd0mz"
    )
end

