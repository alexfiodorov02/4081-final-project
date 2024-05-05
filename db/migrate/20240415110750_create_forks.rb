class CreateForks < ActiveRecord::Migration[7.0]
  def change
    create_table :forks do |t|
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
