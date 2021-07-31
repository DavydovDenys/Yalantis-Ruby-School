require 'rails_helper'

RSpec.feature "Couriers show", type: :feature do
  let!(:courier_a) { Courier.create(name: 'John', email: 'john@example.com') }
  let!(:courier_b) { Courier.create(name: 'Tom', email: 'tom@example.com') }

  scenario 'showing the courier' do
    visit('/couriers')

    find(".courier-#{courier_a.id}").click_link('Show')
  
    expect(page.text).to have_content 'John'
    expect(page.text).to have_content 'john@example.com'
  end
end
