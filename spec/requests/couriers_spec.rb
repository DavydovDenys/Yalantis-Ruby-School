require 'rails_helper'

RSpec.describe 'Couriers', type: :request do
  let!(:courier_a) { Courier.create(name: 'Test_a', email: 'test_a@example.com') }
  let!(:courier_b) { Courier.create(name: 'Test_b', email: 'test_b@example.com') }

  describe 'GET /couriers' do
    before { get couriers_path }

    it do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns all couriers to @couriers' do
      expect(assigns(:couriers)).to eq([courier_b, courier_a])
    end

    it do
      expect(response).to render_template(:index)
    end
  end

  describe 'POST /couriers' do
    it 'creates a new courier' do
      expect do
        post couriers_path, params: { courier: { name: 'Test', email: 'test@example.com'} }
      end.to change { Courier.count }.from(2).to(3)

      follow_redirect!

      expect(response).to render_template(:index)
      expect(response).to have_http_status(:ok)
    end
    
    it 'does not create a new courier' do
      post couriers_path, params: { courier: { name: '', email: 'test@example.com'} }

      expect(response).to render_template(:new)
    end
  end

  describe 'GET /show' do
    it 'shows the courier' do
      get "/couriers/#{courier_a.id}"

      expect(response.body).to render_template(:show)
    end
  end

  describe 'PUT /update' do
    it 'updates the courier' do
      put "/couriers/#{courier_a.id}", params: { courier: { name: 'Updated name' } }

      courier_a.reload

      expect(courier_a.name).to eq('Updated name')
      expect(response.status).to eq(302)

      follow_redirect!

      expect(response.body).to render_template(:show)
    end

    it 'do not update the courier' do
      put "/couriers/#{courier_a.id}", params: { courier: { name: 'n' } }

      expect(response.body).to render_template(:edit)
      expect(response.body).to render_template(:_form)
    end
  end
end
