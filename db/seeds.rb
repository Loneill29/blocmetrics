# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    confirmed_at: Time.now
  )
end

users = User.all

5.times do
  RegisteredApplication.create!(
    user: users.sample,
    name: Faker::Coffee.blend_name,
    url: Faker::Internet.url
  )
end

registered_applications = RegisteredApplication.all

20.times do
  Event.create!(
    registered_application: registered_applications.sample,
    name: Faker::Coffee.variety,
  )
end

events = Event.all

puts "Seed finished"
puts "#{User.count} users created."
puts "#{RegisteredApplication.count} registered applications created."
puts "#{Event.count} events created."
