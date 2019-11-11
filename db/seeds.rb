require 'faker'
require 'open-uri'
status = ['Accepté', 'Refusé', 'En attente' ]


puts "Destroy all instances"
User.destroy_all if Rails.env.development?
Flat.destroy_all if Rails.env.development?
Reservation.destroy_all if Rails.env.development?


puts "Create users"
20.times do
  User.create(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    description: Faker::Lorem.paragraph,
    avatar: "dbr7upry2jb7eulcd0mz"
    )
end

20.times do
  Flat.create(
    title: Faker::Nation.capital_city,
    address: Faker::Address.street_address,
    photo: "bb9c0a8bhb0cshvjiyl2",
    description: Faker::Lorem.paragraph,
    price_per_day: Faker::Number.between(from: 20, to: 300),
    owner_id: Faker::Number.between(from: 0, to: 20)
    )
end

20.times do
  Reservation.create(
    start_date: Date.today,
    end_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
    status: status.sample,
    price: Faker::Number.between(from: 20, to: 300),
    flat_id: Faker::Number.between(from: 0, to: 20),
    guest_id: Faker::Number.between(from: 0, to: 20)
    )
end



