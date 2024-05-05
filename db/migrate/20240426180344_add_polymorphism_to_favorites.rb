class AddPolymorphismToFavorites < ActiveRecord::Migration[7.0]
  def change
    remove_reference :favorites, :post, index: true, foreign_key: true
    add_reference :favorites, :favoritable, polymorphic: true, index: true
    end
end
