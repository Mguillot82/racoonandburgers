# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Reservation.destroy_all
Disponibility.destroy_all
Service.destroy_all
Racoon.destroy_all
User.destroy_all

puts "Creating user..."
salome = User.new(
  {
    email: "racoon1@racoonmail.rac",
    password: "123456",
    username: "testuser1",
    first_name: "testuserfname1",
    last_name: "testuserlname1",
    address: "testuser address 1",
    city: "Toulouse"
  }
)
salome.save!
puts "#{salome.username} created !"

antoine = User.new(
  {
    email: "racoon2@racoonmail.rac",
    password: "123456",
    username: "testuser2",
    first_name: "testuserfname2",
    last_name: "testuserlname2",
    address: "testuser address 2",
    city: "Toulouse"
  }
)
antoine.save!
puts "#{antoine.username} created !"

julien = User.new(
  {
    email: "racoon3@racoonmail.rac",
    password: "123456",
    username: "testuser3",
    first_name: "testuserfname3",
    last_name: "testuserlname3",
    address: "testuser address 3",
    city: "Toulouse"
  }
)
julien.save!
puts "#{julien.username} created !"

bastien = User.new(
  {
    email: "racoon4@racoonmail.rac",
    password: "123456",
    username: "testuser4",
    first_name: "testuserfname4",
    last_name: "testuserlname4",
    address: "testuser address 4",
    city: "Toulouse"
  }
)
bastien.save!
puts "#{bastien.username} created !"

puts "Creating racoons..."
racoon1 = Racoon.new(user_id: salome.id, balance: 0)
racoon1.save!
puts "#{racoon1} created !"

racoon2 = Racoon.new(user_id: antoine.id, balance: 0)
racoon2.save!
puts "#{racoon2} created !"

racoon3 = Racoon.new(user_id: julien.id, balance: 0)
racoon3.save!
puts "#{racoon3} created !"

racoon4 = Racoon.new(user_id: bastien.id, balance: 0)
racoon4.save!
puts "#{racoon4} created !"
puts "Racoons created!!!"

puts "Creating services..."
service1 = Service.new(
  {
    title: 'Vegan HotDog',
    description: 'Vegan hotdog with excellent vegan sausage and beetroot pickle sauce',
    item: 'Hotdog',
    price: '15',
    racoon_id: "#{racoon1.id}"
  }
)
service1.save!
puts "Created #{service1.title}!!!"

service2 = Service.new(
  {
    title: 'Warrior Burger',
    description: 'Maxi burger with giant beef steack, 5 bacon slices and cheddar sauce',
    item: 'Burger',
    price: '25',
    racoon_id: "#{racoon2.id}"
  }
)
service2.save!
puts "Created #{service2.title}!!!"

service3 = Service.new(
  {
    title: 'Racoon Burger',
    description: 'Original burger with mixed meet with nuts, salad and greek sauce',
    item: 'Burger',
    price: '18',
    racoon_id: "#{racoon3.id}"
  }
)
service3.save!
puts "Created #{service3.title}!!!"

service4 = Service.new(
  {
    title: 'MAC Burger',
    description: 'Burger made by the famous MAC',
    item: 'Burger',
    price: '13',
    racoon_id: "#{racoon4.id}"
  }
)
service4.save!
puts "Created #{service4.title}!!!"


####### DISPONIBILITIES #######
status_resa_state = %i[available reserved].sample

puts "Creating dispo..."
dispo1 = Disponibility.new(
  {
    date: '2023-05-31',
    status: "#{status_resa_state}",
    racoon_id: "#{racoon1.id}"
  }
)
dispo1.save!
puts "Dispo1 created!!!"

dispo2 = Disponibility.new(
  {
    date: '2023-06-13',
    status: "#{status_resa_state}",
    racoon_id: "#{racoon2.id}"
  }
)
dispo2.save!
puts "Dispo2 created!!!"

dispo3 = Disponibility.new(
  {
    date: '2023-07-14',
    status: "#{status_resa_state}",
    racoon_id: "#{racoon3.id}"
  }
)
dispo3.save!
puts "Dispo3 created!!!"

dispo4 = Disponibility.new(
  {
    date: '2023-09-24',
    status: "#{status_resa_state}",
    racoon_id: "#{racoon4.id}"
  }
)
dispo4.save!
p dispo4
puts "Dispo4 created!!!"


######## RESERVATIONS ########
status_state = %i[pending cancelled declined accepted].sample

puts "Creating reservations..."

resa1 = Reservation.new(
  {
    status: "#{status_state}",
    disponibility_id: "#{dispo1.id}",
    racoon_id: "#{racoon1.id}",
    user_id: salome.id
  }
)
resa1.save!
puts "Resa1 created!!!!"

resa2 = Reservation.new(
  {
    status: "#{status_state}",
    disponibility_id: "#{dispo2.id}",
    racoon_id: "#{racoon2.id}",
    user_id: antoine.id
  }
)
resa2.save!
puts "Resa2 created!!!!"

resa3 = Reservation.new(
  {
    status: "#{status_state}",
    disponibility_id: "#{dispo3.id}",
    racoon_id: "#{racoon3.id}",
    user_id: julien.id
  }
)
resa3.save!
puts "Resa3 created!!!!"

resa4 = Reservation.new(
  {
    status: "#{status_state}",
    disponibility_id: "#{dispo4.id}",
    racoon_id: "#{racoon4.id}",
    user_id: bastien.id
  }
)
resa4.save!
puts "Resa4 created!!!!"
