require 'person'

RSpec.describe Person do
	context 'have attribute' do
		# before(:each) do
		# 	# puts "BEFORE"
		# 	@person = Person.new("teste", 23)
		# end

		# after(:each) do
		# 	@person.name = 'Noname'
		# 	puts "AFTER #{@person.inspect}"
		# end

		around(:each) do |test|										#around works like before and after together
			@person = Person.new

			test.run

			@person.name = 'Noname'
			puts "AFTER #{@person.inspect}"
		end

		it 'haver_attribute' do
			@person.name = "Teste"
			@person.age = 20

			expect(@person).to have_attributes(name: 'Teste', age: 20)
		end

		it 'haver_attribute' do
			@person.name = "Dog"
			@person.age = 22

			expect(@person).to have_attributes(name: 'Dog', age: 22)
		end

	end
end