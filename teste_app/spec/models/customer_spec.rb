require 'rails_helper'

RSpec.describe Customer, type: :model do
	describe 'create' do
		# fixtures :customers
		# fixtures :all
		it 'should create a customer' do
			# customer = customers(:fulano)  #fixtures
			customer = create(:customer) 	#FactoryBot

			expect(customer.name).to match(/(?<name>[A-Z]\w+)/)
			expect(customer.email).to match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/)
		end

		it 'should overwrite a customer name' do
			customer = create(:customer, name: 'Mauricio') 	#FactoryBot

			expect(customer.name).to eq('Mauricio')
			expect(customer.email).to match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/)
		end

		it 'should create a customer calling :user' do
			customer = create(:user) 	#FactoryBot

			expect(customer.name).to match(/(?<name>[A-Z]\w+)/)
			expect(customer.email).to match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/)
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
			puts attrs
			customer = Customer.create(attrs)
			puts customer.attributes
			expect(customer).to have_attributes(attrs)
		end

		it 'should test for transient attribute' do
			customer = create(:customer, upcased: true)
			expect(customer.name.upcase).to eq(customer.name)
		end

		it { expect{ create(:customer) }.to change{ Customer.all.size }.by(1) }
	end
end