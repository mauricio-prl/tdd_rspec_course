require 'person'

RSpec.describe Person, type: 'collection' do
	subject { described_class.new }

	it 'have_attributes' do
		subject.name = 'Teste'
		subject.age = 20
		expect(subject).to have_attributes(name: starting_with('T'), age: be <= 20)
	end
end