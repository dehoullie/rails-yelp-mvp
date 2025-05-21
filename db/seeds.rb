# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.

# Create 10 restaurants, with 5 reviews each but category can only be one of the following: chinese italian japanese french belgian
categories = %w[chinese italian japanese french belgian]
10.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: categories.sample
  )

  5.times do
    restaurant.reviews.create!(
      content: Faker::Restaurant.review,
      rating: rand(1..5)
    )
  end
end
