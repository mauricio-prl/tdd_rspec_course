# Yes it's a really mess, but it's for learning process
require 'rails_helper'

RSpec.describe Customer, type: :model do
	describe 'create' do
		# fixtures :customers
		# fixtures :all
		it 'should create a customer' do
			# customer = customers(:fulano)  #fixtures
			customer = create(:customer) 	#FactoryBot
			# customer1 = create(:customer) 	# just for test sequence
			
			expect(customer.name).to match(/(?<name>[A-Z]\w+)/)
			expect(customer.email).to match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/)
			expect(customer.address).to match(/(?<adress>\d+\s.+)/)
		end

		it 'should overwrite a customer name' do
			customer = create(:customer, name: 'Mauricio') 	#FactoryBot

			expect(customer.name).to eq('Mauricio')
		end

		it 'should create a customer calling :user' do
			customer = create(:user) 	#FactoryBot

			expect(customer.name).to match(/(?<name>[A-Z]\w+)/)
			expect(customer.email).to match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/)
			expect(customer.address).to match(/(?<adress>\d+\s.+)/)
		end

		it 'should create a not vip customer' do
			customer = create(:customer) 	#FactoryBot

			expect(customer.vip).to be_falsey
			expect(customer.days_to_pay).to be_zero
		end

		it 'should create a vip customer' do
			customer = create(:customer_vip) 	#FactoryBot

			expect(customer.vip).to be_truthy
			expect(customer.days_to_pay).to eq(30)
		end

		it 'should bring all attributes from customer' do
			attrs = attributes_for(:customer)
			# puts attrs
			customer = Customer.create(attrs)
			# puts customer.attributes
			expect(customer).to have_attributes(attrs)
		end

		it 'should test for transient attribute' do
			customer = create(:customer, upcased: true)
			expect(customer.name.upcase).to eq(customer.name)
		end

		it { expect{ create(:customer) }.to change{ Customer.all.size }.by(1) }

		describe 'traits' do
			context 'not vip' do
				it 'should create a male customer' do
					customer = create(:customer_male)

					expect(customer.gender).to eq('male')
				end

				it 'should create a female customer' do
					customer = create(:customer_female)

					expect(customer.gender).to eq('female')
				end			
			end

			context 'vip' do
				it 'should create a vip and male customer' do
					customer = create(:customer_male_vip)

					expect(customer.gender).to eq('male')
					expect(customer.vip?).to be_truthy
				end

				it 'should create a vip and female customer' do
					customer = create(:customer_female_vip)

					expect(customer.gender).to eq('female')
					expect(customer.vip?).to be_truthy
				end
			end
		end

	  it 'has_many orders' do
	  	customer = create(:customer, :with_orders)
	  	# p customer
	  	# p customer.orders
	  	expect(customer.orders.count).to eq(3)
 		end

		describe 'travel_to' do
			it { travel_to Time.zone.local(2004, 11, 24, 01, 04, 44) do
				@past_time = Time.current
				@customer = create(:customer_vip)
			end

			expect(@customer.created_at).to eq(@past_time) }
		end
	end
end