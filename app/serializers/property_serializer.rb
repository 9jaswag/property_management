# frozen_string_literal: true

class PropertySerializer < ActiveModel::Serializer
  attributes :id, :address, :unit, :created_at

  belongs_to :address
  belongs_to :unit
end
