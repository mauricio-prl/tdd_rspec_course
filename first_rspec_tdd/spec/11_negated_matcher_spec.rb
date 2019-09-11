RSpec::Matchers.define_negated_matcher :exclude, :include

RSpec.describe [1,2,3], 'Array' do
	describe '#include' do
		it { expect(subject).to include(2) }
	end

	describe '#exclude' do
		it { expect(subject).to exclude(0,4,5) }
	end
end

RSpec::Matchers.define_negated_matcher :be_not_within, :be_within

RSpec.describe 'be_within' do
	it { expect(12.44324235341242134).to be_within(0.5).of(12)}
	it { expect(11.4).to be_not_within(0.5).of(12)}
	# it { expect(11.4).not_to be_within(0.5).of(12)}  
	# 11.5- 11.6 - 11.7 - 11.8 - 11.9 - 12.0 - 12.1 - 12.2 - 12.3 - 12.4 - 12.5
end