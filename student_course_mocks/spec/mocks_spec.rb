require 'student'
require 'course'

RSpec.describe Student do
	#setup
	let(:student) { described_class.new }
	let(:course) { Course.new }

	describe 'Mocks' do
		context '#bar' do
			it {
				#verify
			 	expect(student).to receive(:bar)

			 	#exercise 
			 	student.bar     #with mock, we need call the method after the verify
		  }
		end

		context 'with arguments' do
			it {
				expect(student).to receive(:foo).with(123)
				student.foo(123)
			}
		end

		context 'with arguments and repetition' do
			it {
				expect(student).to receive(:foo).with(123).twice
				student.foo(123)
				student.foo(123)
			}
		end

		context 'with return' do
			it {
				expect(student).to receive(:foo).with(123).and_return(123)
				student.foo(123)
			}
		end

		it 'is a simple test' do
			expect(student).to receive(:valid?).and_return(true)
			student.valid?
		end
	end
end
