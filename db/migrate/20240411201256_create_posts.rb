class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.string :meal
      t.string :difficulty
      t.string :cuisine

      t.timestamps
    end
  end
end
