require 'rails_helper'

RSpec.describe Package, type: :model do
  let(:courier_a) { Courier.create(name: 'Test_a', email: 'test_a@mail.com') }
  let(:courier_b) { Courier.create(name: 'Test_b', email: 'test_b@mail.com') }
  let(:package) { courier_a.packages.create(tracking_number: '007', delivery_status: true) }
  let(:package_b) { courier_a.packages.create(tracking_number: '007', delivery_status: true) }

  context 'relations' do
    it 'belongs to courier' do
      expect(package.courier_id).to eq(courier_a.id)
    end
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(package).to be_valid
    end

    it 'is not valid when tracking_number is nil' do
      package.tracking_number = nil

      expect(package).not_to be_valid
    end

    it 'is not valid when tracking_number is not unique' do
      package
      package_b

      expect(package_b).not_to be_valid
    end
  end
end
