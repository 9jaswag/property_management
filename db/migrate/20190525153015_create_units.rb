# frozen_string_literal: true

class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.string :type, null: false

      t.timestamps
    end
    add_index :units, :type
  end
end
