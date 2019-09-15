RSpec.describe 'HTTParty' do
	it 'tests the response in json', vcr: { cassette_name: 'jsonplaceholder/posts' } do
		# when we aren't using the VCR, we need to set the stub manually
		# stub_request(:get, "https://jsonplaceholder.typicode.com/posts/2")
		# 	.to_return(status: 200, body: "", headers: { 'content-type' => 'application/json' })

		responde = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
		content_type = responde.headers['content-type']

		expect(content_type).to match(/application\/json/)
	end
end