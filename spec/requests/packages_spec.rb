require 'rails_helper'

RSpec.describe "Packages", type: :request do
  let!(:courier) { Courier.create(name: 'Test_a', email: 'test_a@example.com') }
  let!(:package) { courier.packages.create(tracking_number: '007', delivery_status: true) }
  describe "GET /packages" do
    it 'shows all packages' do
      get courier_path(courier)

      expect(response).to have_http_status(200)
      expect(response.body).to render_template(:show)
    end
  end

  describe 'POST /packages' do
    it 'creates a new package' do
      expect do
        post courier_packages_path(courier), params: { package: { tracking_number: '008', delivery_status: true } }
      end.to change { Package.count }.from(1).to(2)

      expect(response).to have_http_status(:redirect)

      follow_redirect!

      expect(response.body).to render_template(:show)
    end

    it 'does not create a new package' do
      post courier_packages_path(courier), params: { package: { tracking_number: nil, delivery_status: true } }

      follow_redirect!

      expect(response).to render_template(:show)
    end
  end
end
