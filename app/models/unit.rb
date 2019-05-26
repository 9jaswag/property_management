# frozen_string_literal: true

# Unit model
class Unit < ApplicationRecord
  has_one :property

  validates :unit_type, presence: true
end
