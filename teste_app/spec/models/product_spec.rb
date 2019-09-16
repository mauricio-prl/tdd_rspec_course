require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'valid with: description, price and category.' do
  	subject { create(:product) }

  	it { is_expected.to be_valid }
  	it { is_expected.to be_an_instance_of(described_class) }
  end

  context 'validates' do
  	it { is_expected.to validate_presence_of(:description) }
  	it { is_expected.to validate_presence_of(:price) }
  	it { is_expected.to validate_presence_of(:category) }
  end

  context 'associations' do
  	it { is_expected.to belong_to(:category) }
	end

  describe '#full_description' do
  	subject { create(:product) }

  	it { expect(subject.full_description).to eq("#{subject.description}: #{subject.price}")}
  end
end
