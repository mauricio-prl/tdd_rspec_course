RSpec.describe 'satisfy' do
	context 'even number' do
		it { expect(10).to satisfy { |v| v % 2 == 0 } }
	end

	context 'odd number' do
		it { expect(11).to satisfy { |v| v % 2 != 0 } }
	end

	context 'multiple of 3' do
		it { expect(27).to satisfy('be multiple of 3') do |v|
			v % 3 == 0
		end }
	end
end