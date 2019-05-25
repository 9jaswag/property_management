# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:street) }
    it { is_expected.to validate_presence_of(:zipcode) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:country) }
  end

  describe 'database index' do
    it { is_expected.to have_db_index(:street) }
    it { is_expected.to have_db_index(:zipcode) }
    it { is_expected.to have_db_index(:city) }
    it { is_expected.to have_db_index(:state) }
    it { is_expected.to have_db_index(:country) }
  end

  describe '#full_address' do
    it 'returns a property\'s full address' do
      address = build(:address)

      expect(address.full_address)
        .to eq '235 Ikorodu Rd, 100252, Illupeju, Lagos, Nigeria'
    end
  end
end
