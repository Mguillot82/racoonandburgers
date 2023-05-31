# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

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
