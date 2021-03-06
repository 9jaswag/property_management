# frozen_string_literal: true

class AddUserRefToProperty < ActiveRecord::Migration[5.2]
  def change
    add_reference :properties, :user, foreign_key: true
  end
end
