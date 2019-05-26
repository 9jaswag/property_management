# frozen_string_literal: true

class RenameUnitTypeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :units, :type, :unit_type
  end
end
