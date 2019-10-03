require 'rails_helper'

RSpec.feature "Customers", type: :feature do
  describe '#index' do
    context "when the user clicks on the 'Customers' link" do
      before { visit(root_path) }

      it 'returns new customer page' do
        click_on('Customers')

        expect(page).to have_content('Customers')
        expect(page).to have_link('New customer')
      end
    end

    context 'when the customer table has more than one customer' do
      let!(:customer1) { create(:customer) }
      let!(:customer2) { create(:customer) }

      it 'shows all customers name' do
        visit(customers_path)

        expect(page).to have_content(customer1.name)
        expect(page).to have_content(customer2.name)
      end
    end

    context 'index has the show, edit and destroy link' do
      let!(:customer) { create(:customer) }

      it 'should go to show page' do
        # customer = create(:customer)
        visit(customers_path)
        find(:xpath, "/html/body/table/tbody/tr/td[2]/a").click

        expect(page).to have_content(customer.email)
      end

      it 'should go to edit page' do
        # customer = create(:customer)
        visit(customers_path)
        find(:xpath, "/html/body/table/tbody/tr/td[3]/a").click

        expect(page).to have_content("Update #{customer.name}")
      end

      it 'should delete a customer', js: true do
        # customer = create(:customer)
        visit(customers_path)
        find(:xpath, "/html/body/table/tbody/tr/td[4]/a").click
        page.driver.browser.switch_to.alert.accept  #it's confirming the delete request

        expect(page).to have_content('Customer was successfully deleted')
      end
    end
  end

#   describe '#create' do
#     context 'when the user goes to the new customer path and fill the form' do
#       it 'verify form of new customer' do
#         visit(customers_path)
#         click_on('New customer')

#         expect(page).to have_content('new customer')
#       end

#       it 'register a new customer' do
#         customer_name = FFaker::Name.name
        
#         visit(new_customer_path)
#         fill_in('Name', with: customer_name)
#         fill_in('Email', with: FFaker::Internet.email)
#         fill_in('Phone', with: FFaker::PhoneNumber.phone_number)
#         attach_file('Avatar', "#{Rails.root}/spec/fixtures/avatar.png")
#         choose(option: ['Y', 'N'].sample)
#         click_on('Create Customer')

#         expect(page).to have_content('Customer was successfully created')
#         expect(Customer.last.name).to eq(customer_name)
#       end
#     end

#     describe 'sad path' do
#       it 'when the user do not fill any text field' do
#         visit(new_customer_path)
#         click_on('Create Customer')

#         expect(page).to have_content("can't be blank")
#       end
#     end
#   end

#   describe '#show' do
#     it 'shows a client' do
#       customer = Customer.create!(
#         name:   FFaker::Name.name,
#         email:  FFaker::Internet.email,
#         phone:  FFaker::PhoneNumber.phone_number,
#         avatar: "#{Rails.root}/spec/fixtures/avatar.png",
#         smoker: 'N'
#       )

#       visit(customer_path(customer.id))

#       expect(page).to have_content(customer.name)
#     end
#   end

#   describe '#update' do
#     it 'should update the customer' do
#       customer = Customer.create!(
#         name: FFaker::Name.name, 
#         email: FFaker::Internet.email,
#         phone: FFaker::PhoneNumber.phone_number,
#         avatar: "#{Rails.root}/spec/fixtures/avatar.png",
#         smoker: 'S'
#       )
#       new_name = FFaker::Name.name

#       visit(edit_customer_path(customer.id))
#       fill_in('Name', with: new_name)
#       click_on('Update Customer')

#       expect(page).to have_content('Customer was successfully updated')
#     end
#   end
end
