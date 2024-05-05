class CreateBusinesses < ActiveRecord::Migration[7.0]
  def change
    create_table :businesses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :address
      t.string :restaurant_type
      t.text :bio
      t.text :menu

      t.timestamps
    end
  end
end

