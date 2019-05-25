# frozen_string_literal: true

# Unit model
class Unit < ApplicationRecord
  has_one :property

  validates :type, presence: true
end
