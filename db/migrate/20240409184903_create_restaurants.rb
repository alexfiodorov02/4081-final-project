class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :r_name
      t.string :r_address
      t.string :r_type
      t.string :r_city
      t.string :r_state
      t.integer :r_zip

      t.timestamps
    end
  end
end
