RSpec.describe 'be_within' do
	it { expect(12.44324235341242134).to be_within(0.5).of(12)}
	# 11.5- 11.6 - 11.7 - 11.8 - 11.9 - 12.0 - 12.1 - 12.2 - 12.3 - 12.4 - 12.5
end