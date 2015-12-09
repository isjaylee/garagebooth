FactoryGirl.define do
  factory :user do
    email { FactoryGirl.generate(:email) }
    password "pw"
  end
end