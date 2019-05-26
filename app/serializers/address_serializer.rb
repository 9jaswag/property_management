# frozen_string_literal: true

class AddressSerializer < ActiveModel::Serializer
  attributes :street, :zipcode, :city, :state, :country
end
