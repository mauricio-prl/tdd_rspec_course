RSpec.describe 'fair' do
	it { expect(sample_fruta).to eq('banana').or eq('grape').or eq('peaches').or eq('apple')}
end