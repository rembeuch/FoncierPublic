require 'faker'
require 'open-uri'
status = ['Accepté', 'Refusé', 'En attente' ]
url_flat = "https://res.cloudinary.com/cbosseman/image/upload/v1573219418/bb9c0a8bhb0cshvjiyl2.jpg"
url_avatar = "https://res.cloudinary.com/cbosseman/image/upload/v1573492633/52eabf633ca6414e60a7677b0b917d92-male-avatar-maker_fnq3vb.jpg"

puts "Destroy all instances"
Reservation.destroy_all if Rails.env.development?
Flat.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?


puts "Create users"
20.times do
  user = User.new(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    description: Faker::Lorem.paragraph,
    )
  user.remote_avatar_url = url_avatar
  user.save
end

20.times do
  flat = Flat.new(
    title: Faker::Nation.capital_city,
    address: Faker::Address.street_address,
    description: Faker::Lorem.paragraph,
    price_per_day: Faker::Number.between(from: 20, to: 300),
    owner: User.all.sample
    )
  flat.remote_photo_url = url_flat
  flat.save
end

20.times do
  Reservation.create(
    start_date: Date.today,
    end_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
    status: status.sample,
    price: Faker::Number.between(from: 20, to: 300),
    flat: Flat.all.sample,
    guest: User.all.sample
    )
end



