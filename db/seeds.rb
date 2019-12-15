# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
1.upto(30) do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "111111"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
              )
end
1.upto(30) do |n|
  title = Faker::Games::Pokemon.location
  content = Faker::Games::Pokemon.move
  deadline = Faker::Date.forward(days: 10)
  status = Faker::Number.between(from: 0, to: 2)
  priority = Faker::Number.between(from: 0, to: 2)
  user_id = Faker::Number.between(from: 1, to: 10)
  Task.create!(title: title,
               content: content,
               deadline: deadline,
               status: status,
               priority: priority,
               user_id: user_id,
              )
end

User.create!(
  [
    {
      name: "admin1",
      email: "admin@1.com",
      password: "111111",
      password_confirmation: "111111",
      admin: true
    },
    {
      name: "admin2",
      email: "admin@2.com",
      password: "111111",
      password_confirmation: "111111",
      admin: true
    },
    {
      name: "admin3",
      email: "admin@3.com",
      password: "111111",
      password_confirmation: "111111",
      admin: true
      }
    ]
  )
