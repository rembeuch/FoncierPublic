require 'faker'
require 'open-uri'
status = ['Accepté', 'Refusé', 'En attente' ]
url_avatar = "https://res.cloudinary.com/cbosseman/image/upload/v1573492633/52eabf633ca6414e60a7677b0b917d92-male-avatar-maker_fnq3vb.jpg"

puts "Destroy all instances"
Reservation.destroy_all if Rails.env.development?
Flat.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?


puts "Create users"
10.times do
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

  default_user = User.new(
    first_name: "Laszlo",
    last_name: "van daal",
    email: "laszlo@example.com",
    password: "password",
    description: "Président d'une legalTech je cherche frequemment des salles pour organiser des conférences",
    )
  default_user.remote_avatar_url = url_avatar
  default_user.save

puts "Create flats"
flat1 = Flat.new(
    title:  "Le Couvent des Jacobins",
    address: " 20 Place Sainte-Anne, 35000 Rennes",
    description: "Le Couvent des Jacobins, c'est : Un Grand Auditorium pour accueillir jusqu'à 1 200 personnes, jusqu'à 400 personnes dans l'Auditorium patrimonial, une salle plane pour 500 personnes, 25 salles de commissions de 40 à 400 places chacunes, 4 000 m2 d'exposition, jusqu'à 1 500 personnes en dîner assis et 3 000 personnes en cocktail",
    price_per_day: 400,
    owner: User.all.sample
    )
  flat1.photo = File.open(Rails.root.join("db/fixtures/flats/first_flat_image.jpg"))

flat2 = Flat.new(
  title:  "College public Anne de Bretagne",
  address: "15 Rue Martenot, 35000 Rennes",
  description: "Le college public Anne de Bretagne, idéalement situé au coeur de rennes, met à votre disposition une salle de classe avec une capacité de 30 élèves et un appartement de fonction de 55m2",
  price_per_day: 100,
  owner: User.all.sample
  )
flat2.photo = File.open(Rails.root.join("db/fixtures/flats/second_flat_image.jpg"))

flat3 = Flat.new(
  title:  "Terrain non arboré 8000m2",
  address: "51 Rue du Scorff, 35700 Rennes",
  description: "Ce terrain de 8000m2 facile d'accés via la rocade peut vous permettre de stocker vos marchandises.",
  price_per_day: 150,
  owner: User.all.sample
  )
flat3.photo = File.open(Rails.root.join("db/fixtures/flats/third_flat_image.jpg"))

flat4 = Flat.new(
  title:  "Salle Municipale de la Cité",
  address: "10 Rue Saint-Louis, 35000 Rennes",
  description: "Salle Municipale de la Cité vous souhaite la bienvenue. Salle Municipale de la Cité est le lieu idéal pour organiser banquets, séminaires, repas d'affaires, réunions... Capacité totale de 850pers pour un cocktail, 300pers pour réunion/conférence.",
  price_per_day: 150,
  owner: User.all.sample
  )
flat4.photo = File.open(Rails.root.join("db/fixtures/flats/fourth_flat_image.jpg"))

flat1.save
flat2.save
flat3.save
flat4.save

puts "Create reservations"
10.times do
  Reservation.create(
    start_date: Date.today,
    end_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
    status: status.sample,
    price: Faker::Number.between(from: 10, to: 300),
    flat: Flat.all.sample,
    guest: User.all.sample
    )
end

Reservation.create(
  start_date: Date.today,
  end_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
  status: "Refusé",
  price: 300,
  flat: Flat.last,
  guest: default_user
  )
