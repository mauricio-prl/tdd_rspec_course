require 'rails_helper'

RSpec.feature "Welcome", type: :feature do
  #scenario is the same that it
  scenario 'Shows Welcome message' do
    visit('/')

    expect(page).to have_content('Welcome')
  end
end
