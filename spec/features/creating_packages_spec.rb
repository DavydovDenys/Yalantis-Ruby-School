require 'rails_helper'

RSpec.feature "Packages create", type: :feature do
  let!(:courier) { Courier.create(name: 'John', email: 'john@example.com') }
  scenario 'creating a package' do
    visit("/couriers/#{courier.id}")

    fill_in 'package_tracking_number', with: '1'
    check 'package_delivery_status'

    click_button 'Create Package'

    expect(page).to have_content '1'
    expect(page).to have_content true
  end
end
