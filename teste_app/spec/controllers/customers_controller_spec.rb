require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
	describe '#index' do
		context 'when user is a guest' do
			it { get :index; expect(response).to have_http_status(200) }  #the ; just means that is next line
			it { get :index, format: :json; expect(response.content_type).to eq('application/json')}
		end
	end

	describe '#show' do
		let(:customer) { create(:customer) }
		let(:member) { create(:member) }
		before { sign_in member }

		it { get :show, params: { id: customer.id }; expect(response).to have_http_status(200) }
		it { get :show, params: { id: customer.id }; expect(response).to render_template(:show) }

		it 'tests json format' do
			get :show, format: :json, params: { id: customer.id }
			expect(response.content_type).to eq('application/json')
		end
	end

	describe '#create' do
		context 'valid attributes' do
			let(:customer_params) { attributes_for(:customer) }
			let(:member) { create(:member) }
			before { sign_in member }
			let(:response_post) { post :create, params: { customer: customer_params } }

			it { expect{ response_post }.to change(Customer, :count).by(1) }

			it 'tests flash notice' do
				response_post
				expect(flash[:notice]).to match(/successfully created/) 
			end
		end

		context 'invalid attributes' do
			let(:customer_params) { attributes_for(:customer, address: nil) }
			let(:member) { create(:member) }
			before { sign_in member }
			let(:response_post) { post :create, params: { customer: customer_params } }

			it { expect{ response_post }.not_to change(Customer, :count) }
		end
	end

	# describe 'routes' do
	# 	it { is_expected.to route(:get, '/customers').to(action: :index) }
	# end
end
