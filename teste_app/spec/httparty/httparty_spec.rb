RSpec.describe 'HTTParty' do
	it 'tests the response in json', vcr: { cassette_name: 'jsonplaceholder/posts',
		match_requests_on: [:body] } do
		# match_requests_on: [:body] is saying to vcr take the url info, by the body instead the url.
		# with that, we can test others posts for this example. Like 3, 4 or any other.
		# when we aren't using the VCR, we need to set the stub manually
		# stub_request(:get, "https://jsonplaceholder.typicode.com/posts/2")
		# 	.to_return(status: 200, body: "", headers: { 'content-type' => 'application/json' })

		responde = HTTParty.get('https://jsonplaceholder.typicode.com/posts/3')
		content_type = responde.headers['content-type']

		expect(content_type).to match(/application\/json/)
	end
end

# For another context, we might need new episodes:
# In this case, the VCR will record another request from the internet, and save it.
# RSpec.describe 'HTTParty' do
# 	it 'tests the response in json', vcr: { cassette_name: 'jsonplaceholder/posts', :record => :new_episodes } do

# 		responde = HTTParty.get('https://jsonplaceholder.typicode.com/posts/3')
# 		content_type = responde.headers['content-type']

# 		expect(content_type).to match(/application\/json/)
# 	end
# end