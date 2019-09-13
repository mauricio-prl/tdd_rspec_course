FactoryBot.define do
	factory :customer, aliases: [:user] do   #we can also call the factory by user
		name { Faker::Name.name }
		email { Faker::Internet.email }
		vip { false }
		days_to_pay { 0 }

		factory :customer_vip do
			vip { true }
			days_to_pay { 30 }
		end

		transient do
			upcased { false }
		end

		after(:create) do |customer, evaluator|
			customer.name.upcase! if evaluator.upcased
		end
	end
end