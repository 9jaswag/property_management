# frozen_string_literal: true

# Property model
class Property < ApplicationRecord
  belongs_to :address
  belongs_to :unit
  belongs_to :user

  validates_associated :address
  validates_associated :unit

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :unit
end
