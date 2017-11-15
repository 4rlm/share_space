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
15.times do
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

  rand(6..11).times do
    SpaceAmenity.find_or_create_by({
      space_id: new_space.id,
      amenity_id: Amenity.all.sample.id
    })
   end

end

#Create desks for spaces
30.times do
  Desk.create!({
    space_id: Space.all.sample.id,
    description: Faker::Hipster.paragraph,
    price: Faker::Number.decimal(2)
  })
end

#Create bookings
3.times do
  Booking.create({start_date: (Date.today + 2).to_datetime,end_date:  (Date.today + 5).to_datetime, desk_id: Desk.all.sample.id,  user_id: User.all.sample.id})
  Booking.create({start_date: (Date.today + 6).to_datetime,end_date:  (Date.today + 8).to_datetime, desk_id: Desk.all.sample.id,  user_id: User.all.sample.id})
  Booking.create({start_date: (Date.today + 9).to_datetime,end_date:  (Date.today + 14).to_datetime, desk_id: Desk.all.sample.id,  user_id: User.all.sample.id})
  Booking.create({start_date: (Date.today + 15).to_datetime,end_date:  (Date.today + 17).to_datetime, desk_id: Desk.all.sample.id,  user_id: User.all.sample.id})
  Booking.create({start_date: (Date.today + 18).to_datetime,end_date:  (Date.today + 26).to_datetime, desk_id: Desk.all.sample.id,  user_id: User.all.sample.id})
  Booking.create({start_date: (Date.today + 27).to_datetime,end_date:  (Date.today + 31).to_datetime, desk_id: Desk.all.sample.id,  user_id: User.all.sample.id})
  Booking.create({start_date: (Date.today + 32).to_datetime,end_date:  (Date.today + 39).to_datetime, desk_id: Desk.all.sample.id,  user_id: User.all.sample.id})
  Booking.create({start_date: (Date.today + 40).to_datetime,end_date:  (Date.today + 45).to_datetime, desk_id: Desk.all.sample.id,  user_id: User.all.sample.id})
  Booking.create({start_date: (Date.today + 46).to_datetime,end_date:  (Date.today + 60).to_datetime, desk_id: Desk.all.sample.id,  user_id: User.all.sample.id})
  Booking.create({start_date: (Date.today + 61).to_datetime,end_date:  (Date.today + 65).to_datetime, desk_id: Desk.all.sample.id,  user_id: User.all.sample.id})
  Booking.create({start_date: (Date.today + 66).to_datetime,end_date:  (Date.today + 70).to_datetime, desk_id: Desk.all.sample.id,  user_id: User.all.sample.id})
  Booking.create({start_date: (Date.today + 71).to_datetime,end_date:  (Date.today + 73).to_datetime, desk_id: Desk.all.sample.id,  user_id: User.all.sample.id})
  Booking.create({start_date: (Date.today + 74).to_datetime,end_date:  (Date.today + 78).to_datetime, desk_id: Desk.all.sample.id,  user_id: User.all.sample.id})
  Booking.create({start_date: (Date.today + 79).to_datetime,end_date:  (Date.today + 80).to_datetime, desk_id: Desk.all.sample.id,  user_id: User.all.sample.id})
  Booking.create({start_date: (Date.today + 81).to_datetime,end_date:  (Date.today + 88).to_datetime, desk_id: Desk.all.sample.id,  user_id: User.all.sample.id})
  Booking.create({start_date: (Date.today + 89).to_datetime,end_date:  (Date.today + 93).to_datetime, desk_id: Desk.all.sample.id,  user_id: User.all.sample.id})
  Booking.create({start_date: (Date.today + 94).to_datetime,end_date:  (Date.today + 97).to_datetime, desk_id: Desk.all.sample.id,  user_id: User.all.sample.id})
  Booking.create({start_date: (Date.today + 98).to_datetime,end_date:  (Date.today + 102).to_datetime, desk_id: Desk.all.sample.id,  user_id: User.all.sample.id})
  Booking.create({start_date: (Date.today + 103).to_datetime,end_date:  (Date.today + 105).to_datetime, desk_id: Desk.all.sample.id,  user_id: User.all.sample.id})
end


## == AUSTIN ADDRESSES ==
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
Address.create!({space_id: 11, street: '11501 Rock Rose', unit: '#124', city: 'Austin', state: 'TX', zip: '78758', country: 'USA'})
Address.create!({space_id: 12, street: '201 University Blvd', unit: '#580', city: 'Austin', state: 'TX', zip: '78665', country: 'USA'})
Address.create!({space_id: 13, street: '2002 Guadalupe St', unit: 'B', city: 'Austin', state: 'TX', zip: '78705', country: 'USA'})
Address.create!({space_id: 14, street: '1021 E 7th St', unit: '#100', city: 'Austin', state: 'TX', zip: '78702', country: 'USA'})
Address.create!({space_id: 15, street: '1218 West Ave', city: 'Austin', state: 'TX', zip: '78701', country: 'USA'})
# Address.create!({space_id: 16, street: '2504 Whitis Ave', city: 'Austin', state: 'TX', zip: '78705', country: 'USA'})
# Address.create!({space_id: 17, street: '1200 W 6th St', city: 'Austin', state: 'TX', zip: '78703', country: 'USA'})
# Address.create!({space_id: 18, street: '203 E 10th St', city: 'Austin', state: 'TX', zip: '78701', country: 'USA'})
# Address.create!({space_id: 19, street: '2313 Red River St', city: 'Austin', state: 'TX', zip: '78705', country: 'USA'})

## == DALLAS ADDRESSES ==
# Address.create!({space_id: 20, street: '2323 N Jim Miller Rd', city: 'Dallas', state: 'TX', zip: '75227', country: 'USA'})
# Address.create!({space_id: 21, street: '1801 N Griffin St', city: 'Dallas', state: 'TX', zip: '75202', country: 'USA'})
# Address.create!({space_id: 22, street: '1441 N Beckley Ave', city: 'Dallas', state: 'TX', zip: '75203', country: 'USA'})
# Address.create!({space_id: 23, street: '650 R.L. Thornton Fwy', city: 'Dallas', state: 'TX', zip: '75203', country: 'USA'})
# Address.create!({space_id: 24, street: '1230 W Davis St', city: 'Dallas', state: 'TX', zip: '75208', country: 'USA'})
# Address.create!({space_id: 25, street: '8310 Southwestern Blvd', city: 'Dallas', state: 'TX', zip: '75206', country: 'USA'})
# Address.create!({space_id: 26, street: '3656 Howell St', city: 'Dallas', state: 'TX', zip: '75204', country: 'USA'})
# Address.create!({space_id: 27, street: '1515 Knoxville St', city: 'Dallas', state: 'TX', zip: '75211', country: 'USA'})
# Address.create!({space_id: 28, street: '2200 W Red Bird Ln', city: 'Dallas', state: 'TX', zip: '75232', country: 'USA'})

## == HOUSTON ADDRESSES ==
# Address.create!({space_id: 29, street: '3921 Martin Luther King Jr Blvd', city: 'Houston', state: 'TX', zip: '75210', country: 'USA'})
# Address.create!({space_id: 30, street: '2200 Texas Ave', city: 'Houston', state: 'TX', zip: '77003', country: 'USA'})
# Address.create!({space_id: 31, street: '2000 Lyons Ave', city: 'Houston', state: 'TX', zip: '77020', country: 'USA'})
# Address.create!({space_id: 32, street: '1909 McKee St', city: 'Houston', state: 'TX', zip: '77009', country: 'USA'})
# Address.create!({space_id: 33, street: '600 Quitman St', city: 'Houston', state: 'TX', zip: '77009', country: 'USA'})
# Address.create!({space_id: 34, street: '1720 White Oak Dr', city: 'Houston', state: 'TX', zip: '77009', country: 'USA'})
# Address.create!({space_id: 35, street: '1511 Shepherd Dr', city: 'Houston', state: 'TX', zip: '77007', country: 'USA'})
# Address.create!({space_id: 36, street: '6401 Arnot St', city: 'Houston', state: 'TX', zip: '77007', country: 'USA'})
# Address.create!({space_id: 37, street: '3100 Cleburne St', city: 'Houston', state: 'TX', zip: '77004', country: 'USA'})
# Address.create!({space_id: 38, street: '7000 Fannin St', city: 'Houston', state: 'TX', zip: '77030', country: 'USA'})
# Address.create!({space_id: 39, street: '300 Reunion Blvd E', city: 'Houston', state: 'TX', zip: '75207', country: 'USA'})

# find_coordinates(sample)
#
# def find_coordinates(object)
#   coordinates = object.fetch_coordinates
#   object.longitude = coordinates[0]
#   object.latitude = coordinates[1]
#   binding.pry
#
# end
#
# binding.pry
