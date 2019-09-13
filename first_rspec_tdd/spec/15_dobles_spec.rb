RSpec.describe 'test doubles' do
	it 'first test' do
		user = double('User')
		# allow(user).to receive_messages(name: 'Jack', password: 'secret')
		allow(user).to receive(:name).and_return('Jack')  #both are the same
		allow(user).to receive(:password).and_return('secret')
		user.name
	end

	it 'as_null_object' do
		user = double('User').as_null_object
		# allow(user).to receive_messages(name: 'Jack', password: 'secret')
		allow(user).to receive(:name).and_return('Jack')  #both are the same
		allow(user).to receive(:password).and_return('secret')
		user.name		
		user.some_nonexistent_method
	end
end