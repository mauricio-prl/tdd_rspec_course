FactoryBot.define do
  factory :order do
    sequence(:description) { |n| "Order number: #{n}."}
    #associations :customer, factory: :customer   #are the same that just customer
    #its useful when you want to overwrite the factory
    customer  	#when we call just customer, like this way. 
  end   				#RSpec already knows that is a Customer instance
end
