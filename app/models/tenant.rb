# frozen_string_literal: true

# Tenant model
class Tenant < ApplicationRecord
  validates :name, presence: true

  has_many :occupants
  has_many :properties, through: :occupants
end
