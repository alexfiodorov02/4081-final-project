class AddPolymorphismToComments < ActiveRecord::Migration[7.0]
  def change
    remove_reference :comments, :post, index: true, foreign_key: true
    add_reference :comments, :commentable, polymorphic: true, index: true
    end
end
