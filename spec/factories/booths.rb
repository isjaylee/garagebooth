FactoryGirl.define do
  factory :booth do
    name "ABC 123"
    address1 "3001 White Bear Ave"
    city "Maplewood"
    state "MN"
    zipcode "55109"
    email { FactoryGirl.generate(:email) }
    phone "123-456-7890"
    description Faker::Lorem.sentence(3)
    start_date "2015/01/01"
    stop_date "2015/01/15"
    user_id { FactoryGirl.create(:user).id }
  end
end