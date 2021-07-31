require 'rails_helper'

RSpec.feature "Couriers create", type: :feature do
  scenario 'creating with valid data' do
    visit('/couriers')

    click_link 'New'

    fill_in 'courier_name', with: 'John'
    fill_in 'courier_email', with: 'john@example.com'

    click_button 'Submit'

    expect(page.text).to have_content 'John'
    expect(page.text).to have_content 'john@example.com'
  end

  scenario 'do not creating without valid name' do
    visit('/couriers/new')

    fill_in 'courier_name', with: ''
    fill_in 'courier_email', with: 'john@example.com'
  
    click_button 'Submit'

    expect(page.text).to have_content 'Name can\'t be blank'
    expect(page.text).to have_content 'Name is too short (minimum is 3 characters)'
  end

  scenario 'do not creating without valid email' do
    visit('/couriers/new')

    fill_in 'courier_name', with: 'John'
    fill_in 'courier_email', with: 'johnexample'
  
    click_button 'Submit'

    expect(page.text).to have_content 'Email is invalid'
  end
end
