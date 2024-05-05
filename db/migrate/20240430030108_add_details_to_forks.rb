class AddDetailsToForks < ActiveRecord::Migration[7.0]
  def change
    add_column :forks, :description, :text
    add_column :forks, :ingredients, :text
    add_column :forks, :directions, :text
  end
end
