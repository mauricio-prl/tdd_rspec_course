require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'belongs_to customer' do
  	order = create(:order)
  	# p order
  	# p order.customer
  	expect(order.customer).to be_kind_of(Customer)
  end

  it 'has a list of 3 orders' do
  	orders = build_list(:order, 3, description: "Test description.") #we can overwrite 
  	descriptions = orders.map { |order| order.description }					#the attributes

  	expect(orders.count).to eq(3)
  	expect(descriptions[0]).to eq('Test description.')
  	expect(descriptions[1]).to eq('Test description.')
  	expect(descriptions[2]).to eq('Test description.')
  end

  it 'has_many customers' do
  	customer = create(:customer, :with_orders)
  	# p customer
  	# p customer.orders
  	expect(customer.orders.count).to eq(3)
  end
end
