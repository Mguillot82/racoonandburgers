# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
def racoon
  racoon_state = rand(1..3)
  racoon_state == 1
end

User.destroy_all

5.times do |i|
  user = User.save!(
    email: "racoon#{i}@racoonmail.rac",
    password: "123456",
    username: "testuser#{i}",
    first_name: "testuserfname#{i}",
    last_name: "testuserlname#{i}",
    racoon: racoon,
    address: "testuser address #{i}",
    city: "Toulouse"
  )
  puts "#{user.username} created"
end
