require 'rails_helper'

RSpec.describe Courier, type: :model do
  let(:courier) { Courier.create(name: 'Test', email: 'test@example.com') }
  let(:package_a) { courier.packages.create(delivery_status: true, tracking_number: '007') }
  let(:package_b) { courier.packages.create(delivery_status: true, tracking_number: '008') }

  context 'relations' do
    it 'has many packages' do
      package_a
      package_b

      expect(courier.packages.count).to eq(2)
    end
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(courier).to be_valid
    end

    it 'is not valid without a name' do
      courier.name = nil

      expect(courier).not_to be_valid
    end

    it 'is not valid without a proper email' do
      courier.email = 'testexample.com'

      expect(courier).not_to be_valid
    end

    it 'is not valid without a proper length of name' do
      courier.name = 'Te'

      expect(courier).not_to be_valid
    end
  end
end
