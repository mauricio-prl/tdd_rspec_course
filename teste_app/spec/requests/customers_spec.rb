require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe 'json_expectations' do
    describe "/customers.json" do
      it 'has http status 200' do
        get customers_path

        expect(response).to have_http_status(200)
      end

      it 'should has customer attributes' do
        get "/customers.json"
        
        expect(response.body).to include_json([
          id: /\d+/,
          name: (be_kind_of(String)),
          email: (be_kind_of(String)),
        ])
      end
    end

    describe 'show - JSON' do
      it 'should has id: 1' do
        get "/customers/1.json"

        expect(response.body).to include_json(
          id: /\d+/,
          name: (be_kind_of(String)),
          email: (be_kind_of(String)),
        )
      end
    end

    describe 'create - JSON' do
      let(:member) { create(:member) }
      let(:headers) { { "ACCEPT" => "application/json"} }
      let(:customers_params) { attributes_for(:customer) }
      before { login_as(member, scope: :member) }

      it 'should create a customer' do
        post "/customers.json", params: { customer: customers_params}, headers: headers

        expect(response.body).to include_json(
          id: /\d+/,
          name: customers_params[:name],
          email: customers_params.fetch(:email)  #we use the fetch method to show us, when the field is missing.
          # if we have nested attributes:
          # name: customers_params[:address][:street]
          # with fetch it will be like:
          # address: customer_params.fetch(:address).fetch(:street)
        )
      end
    end

    describe 'update - JSON' do
      let(:member) { create(:member) }
      let(:customer) { Customer.first }
      let(:headers) { { "ACCEPT" => "application/json"} }
      before { login_as(member, scope: :member) }

      it 'should update a customer' do
        customer.name = "New name"
        put "/customers/#{ customer.id }.json", params: { customer: customer.attributes }, headers: headers
        customer.reload

        expect(response.body).to include_json(
          id: /\d+/,
          name: customer.name
        )
      end
    end

    describe 'destroy - JSON' do
      let(:member) { create(:member) }
      let(:customer) { Customer.last }
      let(:headers) { { "ACCEPT" => "application/json"} }
      before { login_as(member, scope: :member) }

      it 'should delete a customer' do
        expect{ delete "/customers/#{customer.id}.json", headers: headers }
          .to change(Customer, :count).by(-1)
      end

      it 'returns a 204 http status' do
        delete "/customers/#{customer.id}.json", headers: headers

        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'without json_expectations' do
    describe 'show - JSON' do
      it 'should has id: 1' do
        get "/customers/1.json"
        response_body = JSON.parse(response.body)

        expect(response_body.fetch("id")).to eq(1)
      end
    end
  end

  describe 'JSON Schemas' do
    it 'should be in the customer schema' do
      get '/customers/1.json'

      expect(response).to match_response_schema('customer')
    end
  end
end
