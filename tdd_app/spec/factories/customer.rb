FactoryBot.define do
  factory :customer do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    phone { FFaker::PhoneNumber.phone_number }
    smolker { ['Y', 'N'].sample }
    avatar { "#{Rails.root}/spec/fixtures/avatar.png"}
  end
end
