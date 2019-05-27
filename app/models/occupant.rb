# frozen_string_literal: true

# Occupant model
class Occupant < ApplicationRecord
  belongs_to :property
  belongs_to :tenant

  validates :property_id, uniqueness: { scope: :tenant_id }
  validates :property_id, presence: true
  validates :tenant_id, presence: true
end
