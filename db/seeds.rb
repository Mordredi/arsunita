# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Event.delete_all
Show.delete_all
Ticket.delete_all
Friendship.delete_all
Following.delete_all
EventMember.delete_all
Video.delete_all
Image.delete_all

20.times do
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

20.times do
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

50.times do
  User.all.sample.events.create({
    name: Faker::App.name,
    description: Faker::Company.bs,
    start_date: Faker::Date.between(Date.today, 10.days.from_now),
    end_date: Faker::Date.between(11.days.from_now, 40.days.from_now),
    price_for_general: 15,
    venue: Venue.all.sample,
    category: Category.all.sample
    })
end

User.create({
  email: 'emilia@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Emilia',
  last_name: 'Clarke',
  description: 'I am the Mother of Dragons and the Breaker of Chains',
  profession: 'Actor',
  arts_worker: true
})

User.create({
  email: 'peter@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Peter',
  last_name: 'Dinklage',
  description: "Don't call me Imp",
  profession: 'Actor',
  arts_worker: true
})

User.create({
  email: 'alfie@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Alfie',
  last_name: 'Allen',
  description: 'My name is Reek!',
  profession: 'Actor',
  arts_worker: true
})

User.create({
  email: 'iwan@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Iwan',
  last_name: 'Rheon',
  description: 'I am actully a really nice guy.',
  profession: 'Actor',
  arts_worker: true
})

User.create({
  email: 'nikolaj@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Nikolaj',
  last_name: 'Coster-Waldau',
  description: 'I do love my sister. Just not in that way...',
  profession: 'Actor',
  arts_worker: true
})

User.create({
  email: 'rose@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Rose',
  last_name: 'Leslie',
  description: "He really doesn't know anything",
  profession: 'Actor',
  arts_worker: true
})

User.create({
  email: 'kit@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Kit',
  last_name: 'Harington',
  description: 'I know nothing',
  profession: 'Actor',
  arts_worker: true
})

User.last.events.create({
  name: "Game of Thrones: The Musical",
  description: "An awesome musical by Coldplay",
  start_date: "2015-06-10",
  end_date: "2015-06-11",
  price_for_general: 20,
  venue: Venue.last,
  category: Category.first,
  image: 'http://www.westernmorningnews.co.uk/images/localworld/ugc-images/276272/Article/images/26577496/10152813-large.jpg'
})
