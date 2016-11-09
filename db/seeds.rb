# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Restaurant.destroy_all

Faker::Config.locale = 'fr'

100.times do
  restaurant = Restaurant.create!({
    name: Faker::Team.name.split(' ').map { |item| item.capitalize }.join(' '),
    address: "#{Faker::Address.street_address} #{Faker::Address.zip} #{Faker::Address.city}",
    phone_number: Faker::PhoneNumber.phone_number,
    category: Restaurant::CATEGORIES.sample
  })

  rand(5..10).times do
    restaurant.reviews.create({
      content: Faker::Hipster.paragraph(2),
      rating: (0..5).to_a.sample
    })
  end
end