# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
  User.create({
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Company.bs,
    arts_worker: false
  })
end

10.times do
  User.create({
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Company.bs,
    profession: 'Actor',
    arts_worker: true
  })
end

20.times do
  Event.create({
    name: Faker::App.name,
    description: Faker::Company.bs,
    start_date: Faker::Date.between(Date.today, 10.days.from_now),
    end_date: Faker::Date.between(11.days.from_now, 40.days.from_now),
    price_for_general: 15,
    venue_id: Venue.all.sample,
    user_id: User.all.sample,
    category_id: Category.all.sample
    })
end