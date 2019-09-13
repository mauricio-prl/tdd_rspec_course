require 'student'
require 'course'

RSpec.describe Student do
	let(:student) { described_class.new }
	let(:course) { Course.new }

	describe '#has_finished?' do
		context 'when its true' do
			it {
				allow(student).to receive(:has_finished?)
				.with(course)
				.and_return(true)

			 	expect(student.has_finished?(course)).to be_truthy
		  }
		end

		context 'when its false' do
			it {
				allow(student).to receive(:has_finished?)
				.with(course)
				.and_return(false)

				expect(student.has_finished?(course)).to be_falsy
			}
		end
	end

	describe 'dinamics args' do
		it {
			allow(student).to receive(:foo) do |arg|  #to use stub, we need the method implemented
				if arg == 1
					'the arg was one'
				elsif arg == 2
					'the arg was two'
				end
			end

			expect(student.foo(1)).to eq('the arg was one')
			expect(student.foo(2)).to eq('the arg was two')
		}

		context 'Any instance of(SomeClass)' do
			let(:other_student) { described_class.new }

			it{ 
				allow_any_instance_of(described_class)
				.to receive(:has_finished?)
				.with(course)
				.and_return(true)

				expect(student.has_finished?(course)).to be_truthy
				expect(other_student.has_finished?(course)).to be_truthy
			}
		end
	end

	describe 'errors' do
		it {
			allow(student).to receive(:bar).and_raise(RuntimeError)

			expect { student.bar }.to raise_error(RuntimeError)	
		}		
	end
end