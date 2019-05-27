class CreateOccupants < ActiveRecord::Migration[5.2]
  def change
    create_table :occupants do |t|
      t.references :property, foreign_key: true
      t.references :tenant, foreign_key: true

      t.timestamps
    end
  end
end
