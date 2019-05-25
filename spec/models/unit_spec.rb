# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Unit, type: :model do
  describe 'database index' do
    it { is_expected.to have_db_index(:type) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:type) }
  end
end
