class AddFlagsCountToForks < ActiveRecord::Migration[7.0]
  def change
    add_column :forks, :flags_count, :integer, default: 0
  end
end
