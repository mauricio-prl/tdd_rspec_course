require 'rails_helper'

RSpec.feature "Welcome", type: :feature do
  #scenario is the same that it
  context 'accessing the index page' do
    before { visit(root_path) }

    scenario 'Shows Welcome message' do
      # visit('/') #root page
      # visit(root_path)
      
      expect(page).to have_content('Welcome')
    end

    scenario "Verify the customer's link" do
      expect(find('ul li')).to have_link('Customers')
    end
  end
end
