# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
User.create!(name:  "123321@gmail.com",
             email: "12321@gmail.com",
             password:              "123321",
             password_confirmation: "123321",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

39.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
30.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

microposts = Micropost.all
  3.times do |i|
    r = rand 30
    microposts.each{ |micropost|  micropost.comments.create!(user_id: r,body: Faker::Lorem.question)}
    # c.save
  end
