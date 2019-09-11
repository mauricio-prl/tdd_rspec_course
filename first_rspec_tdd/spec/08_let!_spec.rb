$count = 0

RSpec.describe 'let!' do
	let(:call_order) { [] }

	let!(:counter) do       		#let! runs when the test is called(the it in this case).
		call_order << :let!
		$count += 1 
	end

	it 'calls the helper method before the test' do
		call_order << :example

		expect(call_order).to eq([:let!, :example])
		expect(counter).to eq(1)
	end

end