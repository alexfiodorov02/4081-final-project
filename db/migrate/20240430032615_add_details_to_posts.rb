class AddDetailsToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :description, :text
    add_column :posts, :ingredients, :text
    add_column :posts, :directions, :text
  end
end
