class AddCategoryToTags < ActiveRecord::Migration[7.0]
  def change
    add_column :tags, :category, :string
  end
end
