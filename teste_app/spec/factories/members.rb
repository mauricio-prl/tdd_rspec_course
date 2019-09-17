FactoryBot.define do
  factory :member do
    email { Faker::Internet.email }
    password { 'passowrd' }
    password_confirmation { 'passowrd' }
  end
end
