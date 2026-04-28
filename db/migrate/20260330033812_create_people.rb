class CreatePeople < ActiveRecord::Migration[8.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :username
      t.integer :grad_year
      t.bigint :discord_id

      t.timestamps
    end

    add_index :people, [ :name, :username ]
  end
end
