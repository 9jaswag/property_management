# frozen_string_literal: true

class AddOccupantUniqueConstraint < ActiveRecord::Migration[5.2]
  def change
    add_index :occupants, %i[property_id tenant_id], unique: true
  end
end
