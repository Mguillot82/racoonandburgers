# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# def racoon
#   racoon_state = rand(1..3)
#   racoon_state == 1
# end


# 5.times do |i|
#   user = User.new(
  #     email: "racoon#{i}@racoonmail.rac",
  #     password: "123456",
  #     username: "testuser#{i}",
  #     first_name: "testuserfname#{i}",
  #     last_name: "testuserlname#{i}",
  #     address: "testuser address #{i}",
  #     city: "Toulouse"
  #   )
  #   user.save!
  #   puts "#{user.username} created"
  # end

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


puts "Creating services..."
service1 = Service.new(
  {
    title: 'Vegan Burger',
    description: 'Vegan burger with excellent vegan fake meet and beetroot pickle sauce',
    price: '15',
    racoon_id: "#{salome.id}"
  }
)
service1.save!
puts "Created #{service1.title}!!!"

service2 = Service.new(
  {
    title: 'Warrior Burger',
    description: 'Maxi burger with giant beef steack, 5 bacon slices and cheddar sauce',
    price: '25',
    racoon_id: "#{antoine.id}"
  }
)
service2.save!
puts "Created #{service2.title}!!!"

service3 = Service.new(
  {
    title: 'Racoon Burger',
    description: 'Original burger with mixed meet with nuts, salad and greek sauce',
    price: '18',
    racoon_id: "#{julien.id}"
  }
)
service3.save!
puts "Created #{service3.title}!!!"
