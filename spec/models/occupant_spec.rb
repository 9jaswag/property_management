# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Occupant, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:property_id) }
    it { should validate_presence_of(:tenant_id) }
  end
end
