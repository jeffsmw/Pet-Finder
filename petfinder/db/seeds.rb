# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
100.times do
User.create ({first_name: Faker::Name.first_name,
             last_name:  Faker::Name.last_name,
             email:    "titi@titi.com",
             password: "titi"
           })
end
puts "Generate 100 users"

Message.destroy_all
100.times do
Message.create ({title: Faker::Lorem.sentence,
                body:   Faker::Lorem.paragraphs
              })
end
puts "Generate 100 users"


Sighting.destroy_all
400.times do
Sighting.create ({type:     Faker::Educator.course,
                 last_seen: Faker::Address.street_address,
                 date_seen: Faker::Date.between_except(1.year.ago, 1.year.from_now,
                                   Date.today),
                 note:      Faker::Lorem.paragraph,
                 image:     Faker::Lorem.sentence,
                 contact:   Faker::PhoneNumber
           })
end
puts "Generate 400 sightings"


Pet.destroy_all

120.times do
Pet.create ({type:     Faker::Educator.course,
            breed:     Faker::Beer.name,
            name:      Faker::Pokemon.name,
            sex:       ['M','F'].sample,
            color:     Faker::Color.color_name,
            age:       Faker::Number.between(1, 10),
            last_seen: Faker::Address.street_address,
            date_seen: Faker::Date.between_except(1.year.ago, 1.year.from_now,
                              Date.today),
            note:      Faker::Lorem.paragraph,
            image:     Faker::Lorem.sentence,
            lost:      Faker::Boolean.boolean
              })
end
puts "Generate 120 pets"
