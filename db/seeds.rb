# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(name:  "Eleazar Meza",
             email: "meza.eleazar@gmail.com",
             password:              "abrakadabra",
             password_confirmation: "abrakadabra")

99.times do |n|
  name  = Faker::Name.name
  email = "user#{n+1}@example.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

User.all.each { |user| Post.create title: Faker::Book.title, body: Faker::Movie.quote, user: user }
