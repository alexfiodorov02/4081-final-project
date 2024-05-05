class AddAttributesToForks < ActiveRecord::Migration[7.0]
  def change
    add_column :forks, :title, :string
    add_column :forks, :body, :text
    add_column :forks, :meal, :string
    add_column :forks, :difficulty, :string
    add_column :forks, :cuisine, :string
  end
end
