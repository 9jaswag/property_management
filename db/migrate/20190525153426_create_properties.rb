class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.references :address, foreign_key: true
      t.references :unit, foreign_key: true

      t.timestamps
    end
  end
end
