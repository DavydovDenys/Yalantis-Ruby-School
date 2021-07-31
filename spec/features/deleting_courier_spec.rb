require 'rails_helper'

RSpec.feature "Couriers delete", type: :feature do
  let!(:courier_a) { Courier.create(name: 'John', email: 'john@example.com') }
  let!(:courier_b) { Courier.create(name: 'Tom', email: 'tom@example.com') }

  scenario 'deleting the courier' do
    visit('/couriers')

    expect(page.text).to have_content('John')
    expect(page.text).to have_content('Tom')

    find(".courier-#{courier_a.id}").click_link('Delete')

    expect(page.text).not_to have_content('John')
    expect(page.text).to have_content('Tom')
  end
end
