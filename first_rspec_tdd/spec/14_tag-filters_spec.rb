#It is just a way to run specific tests:

RSpec.describe 'Some test', some_tag_name: true do #when you have a key: value like this 
	it 'should test something' do 										#command: rspec -t some_tag_name
		expect(subject).to eq('Some test')						#or rspec --tag some_tag_name
	end
end

#we also can use this way:
#type: 'collection' on the describe method. And the command is: rspec -t or --tag type:collection
#or just like this:
# RSpec.describe 'some test', :some_kind_of_type do
# 	here go the tests
# end

#we can tag some test to not run it as well:
# RSpec.describe 'some test' do  the command is: rspec -t ~tag
# 	it 'some example', :tag do  	with '~' you are excluding the test.	
# 		some kind of test goes here
# 	end
# end