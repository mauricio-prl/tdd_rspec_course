require 'person'

shared_examples 'status' do |feelling|
	it "#{feelling}" do
		person.send(feelling)
		expect(person.status).to eq("I'm #{feelling}")
	end
end

RSpec.describe Person do
	describe '#status' do
		subject(:person) { described_class.new }

		it_behaves_like 'status', :happy
		it_behaves_like 'status', :sad

		# include_examples 'status', :happy
		# it_should_behave_like 'status', :sad


		# context 'happy' do
		# 	it 'should be happy' do

		# 		person.happy
		# 		expect(person.status).to eq("I'm happy!")
		# 	end
		# end

		# context 'sad' do
		# 	it 'should be sad' do
		# 		person.sad
		# 		expect(person.status).to eq("I'm sad :(")
		# 	end
		# end
	end
end