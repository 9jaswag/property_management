# frozen_string_literal: true

# Address model
class Address < ApplicationRecord
  has_one :property

  validates :street, presence: true
  validates :zipcode, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true

  def full_address
    "#{street}, #{zipcode}, #{city}, #{state}, #{country}"
  end
end
