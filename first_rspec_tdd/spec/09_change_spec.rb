require 'accountant'

RSpec.describe 'changer matcher' do
	context 'when Accountant.qty changes their value' do
		it { expect{ Accountant.increment }.to change { Accountant.qty } }
		it { expect{ Accountant.increment }.to change { Accountant.qty }.by(1) }
		it { expect{ Accountant.increment }.to change { Accountant.qty }.from(2).to(3) }
	end
end