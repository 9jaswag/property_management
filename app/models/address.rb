# frozen_string_literal: true

# Address model
class Address < ApplicationRecord
  validates :street, presence: true
  validates :zipcode, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
end
