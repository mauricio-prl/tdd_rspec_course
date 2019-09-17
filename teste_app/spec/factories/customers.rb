FactoryBot.define do
	factory :customer, aliases: [:user] do   #we can also call the factory by user
		name { Faker::Name.name }
		# email { Faker::Internet.email }
		email { name.downcase.gsub(' ', '_').gsub("'", "") + '@email.com' }
		address { Faker::Address.street_address }
		gender { ['male', 'female'].sample }
		vip { false }
		days_to_pay { 0 }

		# sequence(:email) { |n| "teste_sequence_#{n}@email.com"} 	#it's just for test sequence
		#we can start the sequence from a specific number as well. Like this:
		# sequence(:email, 50) { |n| "teste_sequence_#{n}@email.com"}
		#we also can use any element that has the next method, instead just numbers 	

		# factory :customer_vip do  #without traits
		# 	vip { true }
		# 	days_to_pay { 30 }
		# end

		trait :vip do
			vip { true }
			days_to_pay { 30 }
		end

		trait :male do
			gender { 'male' }
		end

		trait :female do
			gender { 'female' }
		end

		trait :with_orders do
			after(:create) do |customer, evaluator|		
				create_list(:order, evaluator.qty_orders, customer: customer)
			end
		end

		factory :customer_vip, traits: [:vip] 
		factory :customer_male, traits: [:male] 
		factory :customer_female, traits: [:female]

		factory :customer_male_vip, traits: [:vip, :male] 
		factory :customer_female_vip, traits: [:vip, :female] 

		transient do
			upcased { false }
			qty_orders { 3 } 
		end

		#Callbacks:
		# before(:build) 		before to be instanciated
		# after(:build)	 		after to be instanciated
		# before(:create)		before the instance be saved into database
		# after(:create)		after the instance be saved into database

		#'after(:build)' using this, the command runs just after the instance to be created
		#using :create, it will save the instance to the database, and then runs the rest of 
		#the command.
		after(:create) do |customer, evaluator|		
			customer.name.upcase! if evaluator.upcased
		end
	end
end