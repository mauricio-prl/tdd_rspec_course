RSpec.describe 'Classes' do
	context 'be_instance_of' do
		it { expect(2).to be_instance_of(Integer) }  #The exactly class.
	end

	context 'be_kind_of' do
		it { expect(10).to be_kind_of(Numeric) }    #Can be inheritance
	end

	context 'respond_to' do
		let(:some_text) { 'some_text' }
		it { expect(some_text).to respond_to(:size) }
		it { expect(some_text).to respond_to(:count) }
	end

	context 'be_a / be_an' do
		it { expect(2).to be_an(Integer) }
		it { expect('some_text').to be_a(String) }
	end
end