FactoryGirl.define do
  factory :item do
    name "Item 123"
    description Faker::Lorem.sentence(3)
    price Faker::Commerce.price
    booth
    category
  end
end