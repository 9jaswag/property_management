require 'rails_helper'

RSpec.describe Property, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:address) }
    it { should belong_to(:unit) }
  end
end
