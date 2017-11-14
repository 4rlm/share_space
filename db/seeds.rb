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

#Create Admin
admin = User.create(username: 'admin', email: 'admin', password: 'admin', role: 'admin')
admin_profile = Profile.find_or_initialize_by({ first_name: 'Admin', last_name: 'Admin', phone: '512-216-1234'})
admin_profile.user = admin
admin_profile.save!
# binding.pry

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

  # Address.create!({
  #   space_id: new_space.id,
  #   street: Faker::Address.street_address,
  #   unit: Faker::Address.secondary_address,
  #   city: Faker::Address.city,
  #   state: Faker::Address.state,
  #   zip: Faker::Address.zip,
  #   country: Faker::Address.country
  # })

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
    start_date: Faker::Date.forward(20),
    end_date: Faker::Date.forward(60),
    desk_id: Desk.all.sample.id,
    user_id: User.all.sample.id
    })
end

Address.create!({space_id: 1, street: '725 US-290', city: 'Austin', state: 'TX', zip: '78735', country: 'USA'})
Address.create!({space_id: 2, street: '7601 Rialto Blvd', city: 'Austin', state: 'TX', zip: '78735', country: 'USA'})
Address.create!({space_id: 3, street: '2700 Barton Creek Blvd', unit: '#200', city: 'Austin', state: 'TX', zip: '78735', country: 'USA'})
Address.create!({space_id: 4, street: '923 Westbank Dr', unit: '#100', city: 'West Lake Hills', state: 'TX', zip: '78746', country: 'USA'})
Address.create!({space_id: 5, street: '810 Guadalupe St', city: 'Austin', state: 'TX', zip: '78701', country: 'USA'})
Address.create!({space_id: 6, street: '2313 Red River St', city: 'Austin', state: 'TX', zip: '78705', country: 'USA'})
Address.create!({space_id: 7, street: '1501 Enfield Rd', city: 'Austin', state: 'TX', zip: '78703', country: 'USA'})
Address.create!({space_id: 8, street: '205 West 14th Street', city: 'Austin', state: 'TX', zip: '78701', country: 'USA'})
Address.create!({space_id: 9, street: '101 E 21st St', city: 'Austin', state: 'TX', zip: '78712', country: 'USA'})
Address.create!({space_id: 10, street: '1021 E 7th St', unit: 'Ste #100', city: 'Austin', state: 'TX', zip: '78702', country: 'USA'})
