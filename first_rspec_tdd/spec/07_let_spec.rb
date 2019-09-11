require 'person'

RSpec.describe Person do
	context 'have attribute' do
		let(:person) { Person.new }

		it 'haver_attribute with let' do
			person.name = "Teste"
			person.age = 20

			expect(person).to have_attributes(name: 'Teste', age: 20)
		end

		it 'haver_attribute with let' do
			person.name = "Dog"
			person.age = 22

			expect(person).to have_attributes(name: 'Dog', age: 22)
		end

	end
end

$counter = 0

RSpec.describe 'let' do
	let(:count) { $counter += 1 }   #let runs only when its called

	it 'memorize the value' do
		expect(count). to eq(1)  #First time, call let
		expect(count).to eq(1)  #second time, but inside the same it. Uses the cache.
	end

	it "doesn't cached through the tests" do
		expect(count).to eq(2)
	end
end