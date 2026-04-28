class CreateLocations < ActiveRecord::Migration[8.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :aliases
      t.float :lon, precision: 15, scale: 10
      t.float :lat, precision: 15, scale: 10

      t.references :locatable, polymorphic: true, index: true, null: true

      t.timestamps
    end

    add_index :locations, [ :name ]
  end
end
