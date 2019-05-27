# frozen_string_literal: true

# Occupant serializer
class OccupantSerializer < ActiveModel::Serializer
  attributes :id, :property, :tenant

  belongs_to :property
  belongs_to :tenant
end
