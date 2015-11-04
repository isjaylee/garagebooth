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

garage = Garage.create(name: "My Garage", address1: "123 Main Street", city: "Saint Paul", state: "MN", zipcode: "55102", user_id: user.id)

booth = Booth.create(name: "My Booth", garage_id: garage.id, start_date: "2015/01/01", end_date: "2015/01/15")