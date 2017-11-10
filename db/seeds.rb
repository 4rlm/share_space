# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Create amenities
Amenity.create({name: "accessibility"})
Amenity.create({name: "bike_rack"})
Amenity.create({name: "coffee"})
Amenity.create({name: "computer"})
Amenity.create({name: "kitchen"})
Amenity.create({name: "locked_door"})
Amenity.create({name: "monitor"})
Amenity.create({name: "parking"})
Amenity.create({name: "pet_friendly"})
Amenity.create({name: "phone"})
Amenity.create({name: "price"})
Amenity.create({name: "printer"})
Amenity.create({name: "shower"})
Amenity.create({name: "tv"})
Amenity.create({name: "wifi"})


#Create 15 users w/ profiles
15.times do
  new_user = User.create!({
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: "123"
    })

  Profile.create!({
    user_id: new_user.id,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: Faker::PhoneNumber.phone_number
    })
 end

#Create 10 spaces w/ addresses &
10.times do
  new_space = Space.create!({
    name: Faker::Company.name,
    description: Faker::Company.catch_phrase,
    website: Faker::Internet.url,
    phone: Faker::PhoneNumber.phone_number,
    user_id: User.all.sample.id
    })

  Address.create!({
    space_id: new_space.id,
    street: Faker::Address.street_address,
    unit: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip,
    country: Faker::Address.country
  })

  rand(2..10).times do
    SpaceAmenity.find_or_create_by({
      space_id: new_space.id,
      amenity_id: Amenity.all.sample.id
    })
   end

end

#Create desks for spaces
20.times do
  Desk.create!({
    space_id: Space.all.sample.id,
    description: Faker::Hipster.paragraph
  })
end

#Create bookings
10.times do
  Booking.create!({
    booking_date: Faker::Date.forward(60),
    desk_id: Desk.all.sample.id,
    user_id: User.all.sample.id
    })
end






