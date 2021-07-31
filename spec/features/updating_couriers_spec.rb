require 'rails_helper'

RSpec.feature "Couriers update", type: :feature do
  before do
    visit('/couriers/new')

    fill_in 'courier_name', with: 'John'
    fill_in 'courier_email', with: 'john@example.com'

    click_button 'Submit'

    click_link 'Edit'
  end

  scenario 'updating with valid attributes' do
    fill_in 'courier_name', with: 'Tom'
    fill_in 'courier_email', with: 'tom@example.com'

    click_button 'Submit'

    expect(page.text).to have_content 'Tom'
    expect(page.text).to have_content 'tom@example.com'
  end

  scenario 'do not updating with invalid data' do
    fill_in 'courier_name', with: ''
    fill_in 'courier_email', with: 'tomexample.com'

    click_button 'Submit'

    expect(page.text).to have_content 'Name can\'t be blank'
    expect(page.text).to have_content 'Email is invalid'
  end
end
