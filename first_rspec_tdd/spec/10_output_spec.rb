RSpec.describe 'output matcher' do
	it { expect{puts "test"}.to output.to_stdout }
	it { expect{print "test"}.to output('test').to_stdout }
	it { expect{print "some_test"}.to output(/test/).to_stdout }

	it { expect{warn "test"}.to output.to_stderr }
	it { expect{warn "test"}.to output("test\n").to_stderr }
	it { expect{warn "some_test"}.to output(/test/).to_stderr }
end