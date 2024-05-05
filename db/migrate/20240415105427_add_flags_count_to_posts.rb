class AddFlagsCountToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :flags_count, :integer
  end
end
