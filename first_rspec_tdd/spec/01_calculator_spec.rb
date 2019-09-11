require 'calculator'  
# require_relative '../lib/calculator'
																						#We can specify some text in the describe:
RSpec.describe Calculator do 								#describe Calculator, 'some text'
	describe '#sum' do
		context 'for two positive numbers' do   #when you want to run just one context, you can use:
			let(:num1) { 5 }											#rspec spec/<file_name> -e <context_name>
			let(:num2) { 7 }											#you also can use the line number:
																						#rspec spec/01_calculator_spec.rb:24

			it { expect(subject.sum(num1, num2)).to eq(12) }
			# it { expect(subject.sum(num1, num2)).not_to eql(12.0) }
		end

		context 'for mixed numbers' do
			let(:num1) { -5 }
			let(:num2) { 7 }
																												#Using xit instead it you have:
			it { expect(subject.sum(num1, num2)).to eq(2) }   #Temporarily skipped with xit
		end

		context 'for negative numbers' do
			let(:num1) { -5 }
			let(:num2) { -7 }

			it { expect(subject.sum(num1, num2)).to eq(-12) }
		end
	end

	describe '#div' do
		context 'divided by 0' do
			let(:num1) { 10 }
			let(:num2) { 0 }

			#to test an error, we always need to put the expect in a block
			it { expect{ subject.div(num1, num2) }.to raise_error(ZeroDivisionError) }
			#we also can use the error message to test
			it { expect{ subject.div(num1, num2) }.to raise_error('divided by 0') }
			it { expect{ subject.div(num1, num2) }.to raise_error(ZeroDivisionError, 'divided by 0') }
			it { expect{ subject.div(num1, num2) }.to raise_error(/divided/) } #we can use regex as well
		end
	end
end

#About inheritance, the subject always will get the innermost class