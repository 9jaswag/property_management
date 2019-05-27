# frozen_string_literal: true

# Tenant model
class Tenant < ApplicationRecord
  validates :name, presence: true
end
