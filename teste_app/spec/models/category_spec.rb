require 'rails_helper'

RSpec.describe Category, type: :model do
	context 'valid' do
		subject { create(:category) }

		it { is_expected.to be_valid }
		it { is_expected.to be_an_instance_of(described_class) }
	end

	context 'validates' do
		it { is_expected.to validate_presence_of(:description) } #shoulda metchers
	end

	context 'associations' do
		it { is_expected.to have_many(:products) }
	end
end
