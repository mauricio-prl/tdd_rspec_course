require 'rails_helper'

RSpec.feature "Customers", type: :feature, js: true do
  it 'should visit the index page' do
    visit(customers_path)
    # print page.html  #when you want to debbug the page
    page.save_screenshot('screeshot1.png')

    expect(page).to have_current_path(customers_path)
  end
end
