require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'associations' do
  	# order = create(:order)
  	# # p order
  	# # p order.customer
  	# expect(order.customer).to be_kind_of(Customer)
    it { is_expected.to belong_to(:customer) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:customer) }
  end

  it 'has a list of 3 orders' do
  	orders = build_list(:order, 3, description: "Test description.") #we can overwrite 
  	descriptions = orders.map { |order| order.description }					#the attributes

  	expect(orders.count).to eq(3)
  	expect(descriptions[0]).to eq('Test description.')
  	expect(descriptions[1]).to eq('Test description.')
  	expect(descriptions[2]).to eq('Test description.')
  end
end
