# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.text :street, null: false
      t.string :zipcode, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :country, null: false

      t.timestamps
    end
    add_index :addresses, :street
    add_index :addresses, :zipcode
    add_index :addresses, :city
    add_index :addresses, :state
    add_index :addresses, :country
  end
end
