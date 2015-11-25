# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


antiques = Category.where(name: "Antiques").first_or_create(name: "Antiques")
auto = Category.where(name: "Auto").first_or_create(name: "Auto")
furniture = Category.where(name: "Furniture").first_or_create(name: "Furniture")
bikes = Category.where(name: "Bikes").first_or_create(name: "Bikes")
clothes = Category.where(name: "Clothes").first_or_create(name: "Clothes")

user = User.create(email: "bob@example.com", password: "pw")

# 10.times do
#   booth = Booth.create(name: Faker::Company.name,
#                        description: Faker::Lorem.sentence(3),
#                        address1: Faker::Address.street_address,
#                        city: "Saint Paul",
#                        state: "MN",
#                        zipcode: "55102",
#                        user_id: user.id,
#                        start_date: "2015/01/01",
#                        stop_date: "2015/01/15")
# end

# 20.times do
#   Item.create(name: Faker::Commerce.product_name,
#               description: Faker::Lorem.sentence(3),
#               price: rand(1..100),
#               booth_id: rand(1..10),
#               category_id: rand(1..5))
# end